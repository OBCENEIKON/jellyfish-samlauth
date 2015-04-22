require 'omniauth-saml'

module OmniAuth
  module Strategies
    class Samlauth < OmniAuth::Strategies::SAML
      def metadata_url
        full_host + script_name + "#{request_path}/metadata.xml"
      end
    end
  end
end
