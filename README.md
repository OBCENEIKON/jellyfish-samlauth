Jellyfish::SamlAuth
=======
An authentication method using SAML for [Project Jellyfish] (https://github.com/projectjellyfish/api).

https://rubygems.org/gems/jellyfish-samlauth
#### Installation
Include in Gemfile:
```
  gem 'jellyfish-samlauth', git: 'https://github.com/projectjellyfish/jellyfish-samlauth'
```

Run the migration:
```
  rails generate jellyfish_samlauth
  rake db:migrate
```

Add settings to your .env file:
```
  LDAP_TITLE        = "Jellyfish SAML Authentication"
  LDAP_HOST         = ldap.company.com
  LDAP_PORT         = 10636
  # Can be plain or ssl
  LDAP_METHOD       = ssl
  LDAP_BASE         = ou=Users,o=organization_id,dc=company,dc=com
  LDAP_UID          = uid
  LDAP_BIND_DN      = uid=username,ou=Admins,o=organization_id,dc=company,dc=com
  LDAP_PASSWORD     = password
  # Can use name proc or filter, both are optional
  LDAP_NAME_PROC    = "Proc.new {|name| name.gsub(/@.*$/,'')}"
  LDAP_FILTER       = (&(uid=%{username})(memberOf=cn=myapp-users,ou=groups,dc=example,dc=com))
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jellyfish-samlauth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
