require 'highline'
require 'engineyard-api-client'

module EY
  class CLI
    class API < EY::APIClient

      def initialize(token = nil)
        @token = token
        @token ||= EY::EYRC.load.api_token
        @token ||= self.class.fetch_token
        raise EY::Error, "Sorry, we couldn't get your API token." unless @token
      end

      def request(*)
        begin
          super
        rescue EY::APIClient::InvalidCredentials
          EY.ui.warn "Credentials rejected; please authenticate again."
          refresh
          retry
        end
      end

      def refresh
        @token = self.class.fetch_token
      end

      def self.fetch_token
        EY.ui.info("We need to fetch your API token; please log in.")
        begin
          email    = EY.ui.ask("Email: ")
          password = EY.ui.ask("Password: ", true)
          super(email, password)
        rescue EY::APIClient::InvalidCredentials
          EY.ui.warn "Invalid username or password; please try again."
          retry
        end
      end

    end
  end
end
