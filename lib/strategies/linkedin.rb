# lib/strategies/linkedin.rb

module OmniAuth
  module Strategies
    class LinkedIn < OmniAuth::Strategies::OAuth2
      def token_params
        super.tap do |params|
          params.client_secret = options.client_secret
          params.client_id = options.client_id
        end
      end
    end
  end
end
