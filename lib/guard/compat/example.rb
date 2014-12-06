# NOTE: Do NOT require "guard/plugin" - it will either be already required, or
# a stub will be supplied by the test class

module Guard
  class MyPlugin < Plugin
    def start
      Guard::Notifier.notify('foo')

      Guard::UI.info('foo')
      Guard::UI.warning('foo')
      Guard::UI.error('foo')
      Guard::UI.debug('foo')
      Guard::UI.deprecation('foo')
    end

    def run_all
      Guard::Notifier.notify('foo', title: 'bar')

      Guard::UI.info('foo', bar: :baz)
      Guard::UI.warning('foo', bar: :baz)
      Guard::UI.error('foo', bar: :baz)
      Guard::UI.debug('foo', bar: :baz)
      Guard::UI.deprecation('foo', bar: :baz)

      Guard::UI.color_enabled?
    end
  end
end
