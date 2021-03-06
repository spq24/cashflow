require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cashflow
  class Application < Rails::Application
    config.generators do |g|
	 	g.test_framework :rspec,
	 		fixtures: true,
	 		view_specs: false,
	 		helper_specs: false,
	 		routing_specs: false,
	 		controller_specs: true,
	 		request_specs: false
	 	g.fixture_replacement :factory_girl, dir: "spec/factories"
	end

	config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
      end
    end
  end
end
