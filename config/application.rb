require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Drxfer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Create environment variables for external assets' sources if config/external_assets.yml exists
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'external_assets.yml')
      if File.exists?(env_file) 
          YAML.load(File.open(env_file)).each do |key, value|
            ENV[key.to_s] = value
          end
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set base path for transfered files. All files will be copied into this path.            
    # *** MAKE SURE *** to keep the base path description in sync so that it is described correctly.
    config.transfer_destination_base_path = Rails.root
    config.transfer_destination_base_path_description = "the application's root folder."
  end
end
