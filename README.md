# Guard::Compat

Currently, provides only a test helper for testing custom Guard plugins.

## Installation

Add this to your application's Gemfile:

```ruby
group :development do
  gem 'guard-compat', require: false
end
```

And then execute:

    $ bundle

## Usage

Put the following notes in your plugin file (e.g. `lib/guard/myplugin.rb`):

```ruby
# Do NOT require "guard/plugin"
# It will either be required or a stub will be supplied by the test class
```

And in your plugin tests (e.g. `spec/lib/guard/myplugin_spec.rb`):

```ruby
require 'guard/compat/test/helper'
require 'guard/myplugin'

# And your tests instantiating your plugin go here...
```
## Example

See `lib/guard/example.rb` for an example plugin implementation.


## Contributing

1. Fork it ( https://github.com/guard/guard-compat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
