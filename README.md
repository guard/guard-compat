# Guard::Compat

Currently, provides only a test helper for testing custom Guard plugins.

## Installation

Add this to your application's Gemfile:

```ruby
group :test do
  gem 'guard-compat', '>= 0.0.2', require: false
end
```

And then execute:

    $ bundle

## Usage

Put the following notes in your plugin file (e.g. `lib/guard/myplugin.rb`):

```ruby
# Do NOT require "guard/plugin" - it should already required
# by Guard or by the test helper
```

And in your plugin tests (e.g. `spec/lib/guard/myplugin_spec.rb`):

```ruby
require 'guard/compat/test/helper'
require 'guard/myplugin'

# And your tests instantiating your plugin go here...
```
## Example

See [lib/guard/compat/example.rb](https://github.com/guard/guard-compat/blob/master/lib/guard/compat/example.rb ) for an example plugin implementation.

See [spec/guard/compat/example_spec.rb](https://github.com/guard/guard-compat/blob/master/spec/guard/compat/example_spec.rb) for an example on how to test plugins using Guard::Compat.

## Contributing

1. Fork it ( https://github.com/guard/guard-compat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
