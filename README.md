# Guard::Compat

Currently, provides only a test helper for testing custom Guard plugins.

## Usage (in a Guard plugin)

In your gemspec:

```ruby
s.add_dependency('guard-compat', '~> 1.0')
```

In all your plugin files (e.g. `lib/guard/myplugin.rb`):

```ruby
# Don't require "guard/plugin" here or in any other plugin's files
require 'guard/compat/plugin'

module Guard
  class MyPlugin < Plugin
    # (...)
  end
end

```


### IMPORTANT

1) Do not include *any* files from Guard directly (if you need something from Guard which Guard::Compat doesn't provide, file an issue)
2) include 'guard/compat/plugin' is *all* your files which use `Guard::Plugin`
3) make sure you include the `< Plugin` part in *every* file which add classes or methods to your plugin class (important if your plugin consists of multiple files/sub class)


And in your plugin tests (e.g. `spec/lib/guard/myplugin_spec.rb`):

```ruby
require 'guard/compat/test/helper'
require 'guard/myplugin'

# And your tests instantiating your plugin go here...
```

(OPTIONAL: if your plugin consists of many files, you may prefer to add the two above requires to your `spec/spec_helper.rb` or test setup files)


## Example

See [lib/guard/compat/example.rb](https://github.com/guard/guard-compat/blob/master/lib/guard/compat/example.rb ) for an example plugin implementation.

See [spec/guard/compat/example_spec.rb](https://github.com/guard/guard-compat/blob/master/spec/guard/compat/example_spec.rb) for an example on how to test plugins using Guard::Compat.

## Contributing

1. Fork it ( https://github.com/guard/guard-compat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
