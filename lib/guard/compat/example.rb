# NOTE: Do NOT require "guard/plugin" - it will either be already required, or
# a stub will be supplied by the test class

module Guard
  class MyPlugin < Plugin
    def start
      Guard::Notifier.notify('foo', title: 'bar')
      Guard::UI.info('foo')
      Guard::UI.warning('foo')
      Guard::UI.error('foo')
      Guard::UI.debug('foo')
      Guard::UI.deprecation('foo')
    end
  end
end
