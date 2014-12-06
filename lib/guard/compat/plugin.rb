unless Object.const_defined?('Guard::Plugin')
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
