require 'omniauth-saml'

# module OmniAuth
#   module Strategies
#     class Samlauth < OmniAuth::Strategies::SAML
#       option :issuer, nil
#
#       def initialize(app, *args, &block) # rubocop:disable UnusedMethodArgument
#         ap 'inialize'
#         ap callback_url
#         ap options
#         options[:issuer] = callback_url if !options[:issuer]
#         super
#       end
#       # def request_phase
#       #   options[:issuer] = callback_url if !options[:issuer]
#       # end
#     end
#   end
# end

# module JellyfishSamlauth
#   def request_phase
#     ap 'request_phase'
#     @callback_path = nil  # latest version caches callback path
#     # path = options[:callback_path]
#     options[:callback_path] = callback_url
#     # form = super
#     # options[:callback_path] = path
#     # form
#   end
# end

module OmniAuth
  module Strategies
    class Samlauth < OmniAuth::Strategies::SAML
      def metadata_url
        full_host + script_name + "#{request_path}/metadata.xml"
      end
    end
  end
end
