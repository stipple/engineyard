require 'spec_helper'

describe EY::APIClient do
  it "gets the api token from ~/.eyrc if possible" do
    write_eyrc({"api_token" => "asdf"})
    EY::APIClient.new.token.should == "asdf"
  end

  context "fetching the token from EY cloud" do
    before(:each) do
      FakeWeb.register_uri(:post, "https://cloud.engineyard.com/api/v2/authenticate", :body => %|{"api_token": "asdf"}|, :content_type => 'application/json')
      @token = EY::APIClient.fetch_token("a@b.com", "foo")
    end

    it "returns an EY::APIClient" do
      @token.should == "asdf"
    end

    it "puts the api token into .eyrc" do
      read_eyrc["api_token"].should == "asdf"
    end
  end

  it "raises InvalidCredentials when the credentials are invalid" do
    FakeWeb.register_uri(:post, "https://cloud.engineyard.com/api/v2/authenticate", :status => 401, :content_type => 'application/json')

    lambda {
      EY::APIClient.fetch_token("a@b.com", "foo")
    }.should raise_error(EY::Error)
  end

  it "raises RequestFailed with a friendly error when cloud is under maintenance" do
    FakeWeb.register_uri(:post, "https://cloud.engineyard.com/api/v2/authenticate", :status => 502, :content_type => 'text/html')

    lambda {
      EY::APIClient.fetch_token("a@b.com", "foo")
    }.should raise_error(EY::APIClient::RequestFailed, /AppCloud API is temporarily unavailable/)
  end
end
