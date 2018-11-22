# Remmina

Ruby support classes for Remmina. You can encrypt and decrypt password, dump passwords and 
read config files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remmina'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remmina

## Usage command line

If you just need to dumo the password after gem installation, just type:
```
remmina-dump
```

## Usage in Ruby


Basic decryption example:

```ruby
require "remmina"

secretstr='FeIQ1I6+cs5dpS2yvHruae3KKiE8YXKMBs2yFiN0Yjg='
pass=Remmina::Password.new('secret'=>secretstr)
enchash=pass.encrypt_password('test')
puts enchash
```

Basic encryption example:

```ruby
require "remmina"

secretstr='FeIQ1I6+cs5dpS2yvHruae3KKiE8YXKMBs2yFiN0Yjg='
pass=Remmina::Password.new('secret'=>secretstr)
plain=pass.decrypt_password('kl7zf+xc7g4=')
puts plain
```

Basic decryption example (reading secret from default configuration location):

```ruby
require "remmina"

config=Remmina::Config.new
secretstr=config.readsecret(config.deflocation)

pass=Remmina::Password.new('secret'=>secretstr)
encrypted="kl7zf+xc7g4="
plain = pass.decrypt_password(encrypted)
puts plain
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/remmina. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

