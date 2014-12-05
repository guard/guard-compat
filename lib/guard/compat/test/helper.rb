# Minimal stub allowing a plugin to work
module Guard
  class Plugin
    attr_reader :options

    def initialize(options)
      @options = options
    end
  end

  class Notifier
    def self.notify(_msg, _options = {})
      fail NotImplementedError, 'stub this method in your tests'
    end
  end

  class UI
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
