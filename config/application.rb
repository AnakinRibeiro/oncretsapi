require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EvehxElongations
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoloader = :classic

    config.assets.initialize_on_precompile = false

    config.assets.precompile += %w( base.css )
    # precompile themes
    config.assets.precompile += [ 'angle/themes/theme-e.css' ]
    # Controller assets
    config.assets.precompile += [
                                  # EVEHX
                                  'constructions.css',
                                  'devise/sessions.css',
                                  'devise/registrations.css',
                                  'devise/passwords.css',
                                  'addresses.css',
                                  'jacks.css',
                                  'users.css',
                                  'projects.css',
                                  'spreadsheets.css',
                                  'cables.css',
                                  'elongations.css',
                                  'users/sessions.css',
                                  'pumps.css',
                                  'spreadsheets_equipments',
                                # Stylesheets
                                #'charts.css',
                                'dashboard.css'
                                #'elements.css',
                                #'extras.css',
                                #  'forms.css',
                                #  'maps.css',
                                #  'multilevel.css',
                                #  'pages.css',
                                #  'tables.css',
                                #  'widgets.css',
                                #  'blog.css',
                                #  'ecommerce.css',
                                #  'forum.css'
                                ]

  end
end
