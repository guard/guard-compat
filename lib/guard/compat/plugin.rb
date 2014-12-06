# Note: currently, this file only exists to allow Bundler to require this file
# without crashing (e.g. when Guard hasn't been included)

unless Object.const_defined?('Guard')
  module Guard
  end
end

unless Guard.const_defined?('Plugin')
  # Provided empty definition so requiring the plugin without Guard won't crash
  # (e.g. when added to a Gemfile without `require: false`)
  module Guard
    class Plugin
      def initialize
        fail NotImplementedError
      end
    end
  end
end
