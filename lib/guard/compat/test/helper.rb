# Minimal stub allowing a plugin to work

require 'guard/compat/plugin'

module Guard
  class Plugin
    attr_reader :options

    def initialize(options = {})
      @options = options
    end
  end

  # Stub, but allow real Notifier to be used, because e.g. guard-minitest uses
  # is while guard-process is being tested
  unless Guard.const_defined?('Notifier')
    module Notifier
      def self.notify(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end
    end
  end

  # Stub, but allow real UI to be used, because e.g. guard-minitest uses it
  # through using Guard::Notifier
  unless Guard.const_defined?('UI')
    module UI
      def self.info(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end

      def self.warning(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end

      def self.error(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end

      def self.debug(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end

      def self.deprecation(_msg, _options = {})
        fail NotImplementedError, 'stub this method in your tests'
      end
    end
  end
end
