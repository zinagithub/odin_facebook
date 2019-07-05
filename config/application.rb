require_relative 'boot'

require 'rails/all'
require 'dotenv-rails'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OdinFacebook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
	  g.test_framework :rspec,
	    :fixtures => true,
	    :view_specs => false,
	    :helper_specs => false,
	    :routing_specs => false,
	    :controller_specs => true,
	    :request_specs => true
	  g.fixture_replacement :factory_bot, :dir => "spec/factories"
	end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
