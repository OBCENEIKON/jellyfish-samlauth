class SamlSetup
  def self.call(env)
    new(env).setup
  end

  def initialize(env)
    @env = env
    @request = ActionDispatch::Request.new(env)
  end

  def setup
    sp_settings
    securiity_settings
    configure_attributes
    idp_settings
  end

  private

  def sp_settings
    @env['omniauth.strategy'].options[:issuer] ||= @env['omniauth.strategy'].metadata_url
    @env['omniauth.strategy'].options[:assertion_consumer_service_url] ||= @env['omniauth.strategy'].callback_url
    @env['omniauth.strategy'].options[:assertion_consumer_service_binding] ||= 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'.freeze
    @env['omniauth.strategy'].options[:compress_request] ||= true
    @env['omniauth.strategy'].options[:compress_response] ||= true
    @env['omniauth.strategy'].options[:double_quote_xml_attribute_values] ||= false
    @env['omniauth.strategy'].options[:passive] ||= false
    @env['omniauth.strategy'].options[:authn_context] ||= 'urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport'
  end

  def securiity_settings
    @env['omniauth.strategy'].options[:security][:authn_requests_signed] ||= false
    @env['omniauth.strategy'].options[:security][:authn_requests_signed] ||= false
    @env['omniauth.strategy'].options[:security][:logout_requests_signed] ||= false
    @env['omniauth.strategy'].options[:security][:logout_responses_signed] ||= false
    @env['omniauth.strategy'].options[:security][:embed_sign] ||= false
    @env['omniauth.strategy'].options[:security][:digest_method] ||= XMLSecurity::Document::SHA1
    @env['omniauth.strategy'].options[:security][:signature_method] ||= XMLSecurity::Document::SHA1
  end

  def idp_settings
    @env['omniauth.strategy'].options[:idp_cert_fingerprint_validator] ||= -> (fingerprint) { fingerprint }
    @env['omniauth.strategy'].options[:idp_sso_target_url_runtime_params] ||= { original_request_param: :mapped_idp_param }
    @env['omniauth.strategy'].options[:idp_cert_fingerprint_algorithm] ||= -> { XMLSecurity::Document::SHA1 }
  end

  def configure_attributes
    attrs = ENV.select do |k, _v|
      k.starts_with?('SAML_ATTRIBUTE_')
    end

    @attributes = {}

    attrs.each do |k, v|
      @attributes[k.to_sym] = {}

      v.gsub('"', '').gsub("'", '').split(',').each do |pair|
        key, value = pair.split(/:/)
        @attributes[k.to_sym][key.strip.to_sym] = value.strip
      end
    end

    return false unless @attributes.empty?

    @env['omniauth.strategy'].options[:attribute_consuming_service].configure do
      service_name @env['omniauth.strategy'].options[:service_name]
      service_index @env['omniauth.strategy'].options[:service_index]

      @attributes.each_value do |value|
        add_attribute value
      end
    end
  end
end
