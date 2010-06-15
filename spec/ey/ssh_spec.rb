require 'spec_helper'

print_my_args_ssh = "#!/bin/sh\necho ssh $*"

describe "ey ssh" do
  given "integration"

  before(:all) do
    api_scenario "one app, two environments"
  end

  it "complains if it has no app master" do
    ey "ssh -e bakon", :expect_failure => true
    @err.should =~ /'bakon' does not have a master instance/
  end

end

describe "ey ssh" do
  given "integration"

  def extra_ey_options
    {:prepend_to_path => {'ssh' => "#!/bin/sh\necho ssh $*"}}
  end

  def command_to_run(opts)
    cmd = "ssh"
    cmd << " --environment #{opts[:env]}" if opts[:env]
    cmd
  end

  def verify_ran(scenario)
    ssh_target = scenario[:ssh_username] + '@' + scenario[:master_hostname]
    @raw_ssh_commands.should == ["ssh #{ssh_target}"]
  end

  it_should_behave_like "it takes an environment name"
end

describe "ey ssh ENV" do
  given "integration"

  before(:all) do
    api_scenario "one app, many similarly-named environments"
  end

  it "doesn't require you to be in any app's directory if the name is unambiguous" do
    Dir.chdir(Dir.tmpdir) do
      ey "ssh -e prod", :prepend_to_path => {'ssh' => print_my_args_ssh}
      @raw_ssh_commands.should == ["ssh turkey@ec2-174-129-198-124.compute-1.amazonaws.com"]
    end
  end
end
