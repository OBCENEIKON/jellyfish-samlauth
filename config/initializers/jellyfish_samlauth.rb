Rails.application.config.middleware.use OmniAuth::Builder do
  provider :samlauth,
           # SP Settings
           # ==================================================================
           # Required
           # ------------------------------------------------------------------
           issuer: ENV['SAML_ISSUER'],
           certificate: ENV['SAML_CERTIFICATE'] || nil,
           assertion_consumer_service_url: ENV['SAML_ASSERTION_CONSUMER_SERVICE_URL'],
           assertion_consumer_service_binding: ENV['SAML_ASSERTION_CONSUMER_SERVICE__BINDING'],
           compress_request: ENV['SAML_COMPRESS_REQUEST'] ? ENV['SAML_COMPRESS_REQUEST'].to_bool : true,
           compress_response: ENV['SAML_COMPRESS_RESPONSE'] ? ENV['SAML_COMPRESS_RESPONSE'].to_bool : true,
           double_quote_xml_attribute_values: ENV['SAML_DOUBLE_QUOTE_XML_ATTRIBUTE_VALUES'] ? ENV['SAML_DOUBLE_QUOTE_XML_ATTRIBUTE_VALUES'].to_bool : false,
           passive: ENV['SAML_PASSIVE'] ? ENV['SAML_PASSIVE'].to_bool : false,

           security: {
             authn_requests_signed: ENV['SAML_AUTHN_REQUESTS_SIGNED'] ? ENV['SAML_AUTHN_REQUESTS_SIGNED'].to_bool : false,
             logout_requests_signed: ENV['SAML_LOGOUT_REQUESTS_SIGNED'] ? ENV['SAML_LOGOUT_REQUESTS_SIGNED'].to_bool : false,
             logout_responses_signed: ENV['SAML_LOGOUT_RESPONSES_SIGNED'] ? ENV['SAML_LOGOUT_RESPONSES_SIGNED'].to_bool : false,
             embed_sign: ENV['SAML_EMBED_SIGNED'] ? ENV['SAML_EMBED_SIGNED'].to_bool : false,
             digest_method: ENV['SAML_DIGEST_METHOD'],
             signature_method: ENV['SAML_SIGNATURE_METHOD']
           },

           # Optional
           # ------------------------------------------------------------------
           # If the IdP provides your XML data, specify the URL that it's located at
           idp_metadata_url: ENV['SAML_IDP_METADATA_URL'] || nil,
           sp_name_qualifier: ENV['SAML_SP_NAME_QUALIFIER'] || nil,
           private_key: ENV['SAML_PRIVATE_KEY'] || nil,
           assertion_consumer_logout_service_url: ENV['SAML_ASSERTION_CONSUMER_LOGOUT_SERVICE_URL'] || nil,
           assertion_consumer_logout_service_binding: ENV['SAML_ASSERTION_CONSUMER_LOGOUT_SERVICE_BINDING'] || nil,
           name_identifier_format: ENV['SAML_NAME_IDENTIFIER_FORMAT'] || nil,
           name_identifier_value: ENV['SAML_NAME_IDENTIFIER_VALUE'] || nil,
           sessionindex: ENV['SAML_SESSIONINDEX'] || nil,
           protocol_binding: ENV['SAML_PROTOCOL_BINDING'] || nil,
           force_authn: ENV['SAML_FORCE_AUTHN'] ? ENV['SAML_FORCE_AUTHN'].to_bool : nil,
           authn_context: ENV['SAML_AUTHN_CONTEXT'] || nil,
           authn_context_decl_ref: ENV['SAML_AUTHN_CONTEXT_DECL_REF'] || nil,
           authn_context_comparison: ENV['SAML_AUTHN_CONTEXT_COMPARISON'] || nil,

           attributes_index: ENV['SAML_ATTRIBUTES_INDEX'] || nil,
           attribute_consuming_service: {
             service_name: ENV['SAML_SERVICE_NAME'] || nil,
             service_index: ENV['SAML_SERVICE_INDEX'] || nil,

             # For each attribute create an environment variable with the number of the attribute as a suffix
             # Example:
             #  SAML_ATTRIBUTE_1="name: 'Name', name_format: 'Name Format', friendly_name: 'Friendly Name'"
             #  SAML_ATTRIBUTE_2="name: 'Another Attibute', name_format: 'Name Format', friendly_name: 'Friendly Name', attribute_value: 'Attribute Value'"
             add_attribute: nil
           },

           # IdP Settings
           # ==================================================================
           # Required
           # ------------------------------------------------------------------
           idp_sso_target_url: ENV['SAML_IDP_SSO_TARGET_URL'] || nil,

           # Either idp_cert, idp_cert_fingerprint or idp_cert_fingerprint_validator must be present
           idp_cert: ENV['SAML_IDP_CERT'] || nil,
           idp_cert_fingerprint: ENV['SAML_IDP_CERT_FINGERPRINT'] || nil,
           idp_cert_fingerprint_validator: ENV['SAML_IDP_CERT_FINGERPRINT_VALIDATOR'],

           # Optional
           # ------------------------------------------------------------------
           idp_slo_target_url: ENV['SAML_IDP_SLO_TARGET_URL'] || nil,
           idp_sso_target_url_runtime_params: ENV['SAML_IDP_SSO_TARGET_URL_RUNTIME_PARAMS'],
           idp_entity_id: ENV['SAML_IDP_ENTITY_ID'] || nil,
           idp_cert_fingerprint_algorithm: ENV['SAML_IDP_CERT_FINGERPRINT_ALGORITHM'],
           single_logout_service_url: ENV['SAML_SINGLE_LOGOUT_SERVICE_URL'] || nil,
           single_logout_service_binding: ENV['SAML_LOGOUT_SERVICE_BINDING'] || nil,

           setup: SamlSetup,

           # This needs to be here for the devise scope
           path_prefix: ENV['SAML_PATH_PREFIX'] || '/api/v1/staff/auth'
end
