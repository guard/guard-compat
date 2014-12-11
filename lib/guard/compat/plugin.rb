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
      def initialize(_options = {})
        msg = 'either Guard has not been required or you did not' \
          ' include guard/compat/test/helper'
        fail NotImplementedError, msg
      end
    end
  end
end

module Guard
  module Compat
    # TODO: this is just a temporary workaround to allow plugins
    # to use watcher patterns in run_all
    def self.matching_files(plugin, files)
      unless Guard.const_defined?('Watcher')
        msg = 'either Guard has not been required or you did not' \
          ' stub this method in your plugin tests'
        fail NotImplementedError, msg
      end

      # TODO: uniq not tested
      # TODO: resolve symlinks and then uniq?
      Guard::Watcher.match_files(plugin, files).uniq
    end

    def self.watched_directories
      unless Guard.const_defined?('CLI')
        msg = 'either Guard has not been required or you did not' \
          ' stub this method in your plugin tests'
        fail NotImplementedError, msg
      end

      if Guard.respond_to?(:state)
        # TODO: the new version is temporary
        Guard.state.session.watchdirs.map { |d| Pathname(d) }
      else
        dirs = Array(Guard.options(:watchdir))
        dirs.empty? ? [Pathname.pwd] : dirs.map { |d| Pathname(d) }
      end
    end

    module UI
      def self.color(text, *colors)
        Guard::UI.send(:color, text, *colors)
      end

      def self.color_enabled?
        Guard::UI.send(:color_enabled?)
      end

      def self.info(message, options = {})
        Guard::UI.info(message, options)
      end

      def self.warning(message, options = {})
        Guard::UI.warning(message, options)
      end

      def self.error(message, options = {})
        Guard::UI.error(message, options)
      end

      def self.debug(message, options = {})
        Guard::UI.debug(message, options)
      end

      def self.deprecation(message, options = {})
        Guard::UI.deprecation(message, options)
      end

      def self.notify(message, options = {})
        Guard::Notifier.notify(message, options)
      end
    end
  end
end
