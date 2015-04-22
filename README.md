Jellyfish::SamlAuth
=======
An authentication method using SAML for [Project Jellyfish] (https://github.com/projectjellyfish/api).

https://rubygems.org/gems/jellyfish-samlauth
#### Installation
Include in Gemfile:
```
  gem 'jellyfish-samlauth', git: 'https://github.com/projectjellyfish/jellyfish-samlauth'
```

Add settings to your .env file:
```
  # SP Settings
  # ==================================================================
  # Required
  # ------------------------------------------------------------------
  # Defaults to http(s)://<hostname>/<path_prefix>/:provider/metadata.xml if not entered
  SAML_ISSUER                              = http://www.example.com/saml/metadata.xml
  SAML_CERTIFICATE                         = "-----BEGIN CERTIFICATE-----\nMIIDbzCCAtigAwIBAgIJALLyD62/xQ5WMA0GCSqGSIb3DQEBBQUAMIGCMQswCQYD\nVQQGEwJVUzEOMAwGA1UECBMFVGV4YXMxITAfBgNVBAoTGEludGVybmV0IFdpZGdp\ndHMgUHR5IEx0ZDEYMBYGA1UEAxMPSmVyaW1pYWggTWlsdG9uMSYwJAYJKoZIhvcN\nAQkBFhdtaWx0b25famVyaW1pYWhAYmFoLmNvbTAeFw0xNTA0MDkyMDI3MzlaFw0x\nODA0MDgyMDI3MzlaMIGCMQswCQYDVQQGEwJVUzEOMAwGA1UECBMFVGV4YXMxITAf\nBgNVBAoTGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAxMPSmVyaW1p\nYWggTWlsdG9uMSYwJAYJKoZIhvcNAQkBFhdtaWx0b25famVyaW1pYWhAYmFoLmNv\nbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAlG570+tDpHHkVJASVhaUIYwN\nwN4zePFDBUkwmtGSho5NF8glIunZDNjnJ1mG5TG15Eg3UvJUk6+xsN9VXCdBS4Y8\nLpUhT2bhbiZWWvDKcbDOPOq8pDTlhBC2YBEvFtuPkCx2tA7H8m0o+JRH+GokaDSY\nI8WhH9mii1PpgEvBzKkCAwEAAaOB6jCB5zAdBgNVHQ4EFgQUHa3b8vUm18bOsMuE\nXf9JLxyiVJgwgbcGA1UdIwSBrzCBrIAUHa3b8vUm18bOsMuEXf9JLxyiVJihgYik\ngYUwgYIxCzAJBgNVBAYTAlVTMQ4wDAYDVQQIEwVUZXhhczEhMB8GA1UEChMYSW50\nZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMRgwFgYDVQQDEw9KZXJpbWlhaCBNaWx0b24x\nJjAkBgkqhkiG9w0BCQEWF21pbHRvbl9qZXJpbWlhaEBiYWguY29tggkAsvIPrb/F\nDlYwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQAKu7O244ykwkD3GoMJ\nrX9D+Wnb40yKaf+nw2HOzFJoBUfw8ZAg8bCpylKfgtDeNHF8maS2GYNgV6DSVpvN\nZO010V1TQElu+KjiA7tmO/+Q7f+rK4cs9rxdadlxViqKQRNMCfkHE9/zLR55BhF1\nEsfmBbBdnRLMj4mjPc9gk+wh8w==\n-----END CERTIFICATE-----"
  # Defaults to http(s)://<hostname>/<path_prefix>/:provider/callback?<query_string> if not entered
  SAML_ASSERTION_CONSUMER_SERVICE_URL      =
  # Defaults to urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST if not entered
  SAML_ASSERTION_CONSUMER_SERVICE__BINDING =
  SAML_COMPRESS_REQUEST                    = true # Defaults to true
  SAML_COMPRESS_RESPONSE                   = true # Defaults to true
  SAML_DOUBLE_QUOTE_XML_ATTRIBUTE_VALUES   = false # Defaults to false
  SAML_PASSIVE                             = false # Defaults to false

  # Security Settings
  # ------------------------------------------------------------------
  # Defaults to false if not entered
  SAML_AUTHN_REQUESTS_SIGNED               = false # Defaults to false
  SAML_LOGOUT_REQUESTS_SIGNED              = false # Defaults to false
  SAML_LOGOUT_RESPONSES_SIGNED             = false # Defaults to false
  SAML_EMBED_SIGNED                        = false # Defaults to false
  # Defaults to XMLSecurity::Document::SHA1 if not entered
  SAML_DIGEST_METHOD                       = XMLSecurity::Document::SHA1
  # Defaults to XMLSecurity::Document::SHA1 if not entered
  SAML_SIGNATURE_METHOD                    = XMLSecurity::Document::SHA1

  # Attribute Service Settings
  # ------------------------------------------------------------------
  SAML_ATTRIBUTES_INDEX                    = nil # Defaults to nil
  SAML_SERVICE_NAME                        = nil # Defaults to nil
  SAML_SERVICE_INDEX                       = nil # Defaults to nil
  # For each attribute create an environment variable with the number of the attribute as a suffix
  # Example:
  #  SAML_ATTRIBUTE_1="name: 'Name', name_format: 'Name Format', friendly_name: 'Friendly Name'"
  #  SAML_ATTRIBUTE_2="name: 'Another Attibute', name_format: 'Name Format', friendly_name: 'Friendly Name', attribute_value: 'Attribute Value'"

  # IdP Settings
  # ==================================================================
  # Required
  # ------------------------------------------------------------------
  # Required unless SAML_IDP_METADATA_URL is set
  SAML_IDP_SSO_TARGET_URL                  = nil # Defaults to nil

  # Either idp_cert, idp_cert_fingerprint or idp_cert_fingerprint_validator must be present
  SAML_IDP_CERT                            = nil # Defaults to nil
  SAML_IDP_CERT_FINGERPRINT                = nil # Defaults to nil
  # Defaults to -> (fingerprint) { fingerprint } if not entered
  SAML_IDP_CERT_FINGERPRINT_VALIDATOR      = "-> (fingerprint) { fingerprint }"

  # Optional
  # ------------------------------------------------------------------
  SAML_IDP_SLO_TARGET_URL                  = nil # Defaults to nil
  # Defaults to { original_request_param: :mapped_idp_param } if not entered
  SAML_IDP_SSO_TARGET_URL_RUNTIME_PARAMS   = "{ original_request_param: :mapped_idp_param }"
  SAML_IDP_ENTITY_ID                       = nil # Defaults to nil
  # Defaults to -> { XMLSecurity::Document::SHA1 } if not entered
  SAML_IDP_CERT_FINGERPRINT_ALGORITHM      = "-> { XMLSecurity::Document::SHA1 }"
  SAML_SINGLE_LOGOUT_SERVICE_URL           = nil # Defaults to nil
  SAML_LOGOUT_SERVICE_BINDING              = nil # Defaults to nil

  # Required for devise scope, defaults to /api/v1/staff/auth if not entered
  SAML_PATH_PREFIX                         = /api/v1/staff/auth
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jellyfish-samlauth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
