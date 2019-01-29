require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

Bundler.require(*Rails.groups)
Dotenv::Railtie.load
ENVied.require(*ENV['ENVIED_GROUPS'] || Rails.groups)

module BackendRecruitment
  class Application < Rails::Application
    config.load_defaults 5.2

    config.active_record.schema_format = :sql
    config.active_record.default_timezone = :utc
    config.i18n.default_locale = :en

    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.factory_girl false
      generate.system_tests false
    end

  end
end
