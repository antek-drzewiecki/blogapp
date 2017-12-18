module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options, {
          :site => "http://localhost:3000",
          :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
            :email => raw_info["email"]
        }
      end

      def raw_info
        puts access_token.inspect
        @raw_info ||= access_token.get('/api/v1/users/me.json').parsed
      end


      # MonkeyPatch for https://github.com/omniauth/omniauth-oauth2/issues/81
      # Bug as described in https://github.com/doorkeeper-gem/doorkeeper/issues/732
      #
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end