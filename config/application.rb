require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BaseRails
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.action_dispatch.default_headers = {
      'Content-Type' => 'text/html; charset=utf-8'
    }
  end
end
