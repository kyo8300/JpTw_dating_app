require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module JTDatingApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    I18n.available_locales = %i(ja en zh)
    I18n.enforce_available_locales = true
    I18n.default_locale = :en
    
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    
    
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end