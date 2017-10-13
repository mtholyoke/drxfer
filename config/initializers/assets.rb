# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Create config variable for external assets' sources if config/external_assets.yml exists
external_assets_file = File.join(Rails.root, "config", "external_assets.yml")
if File.exists? external_assets_file
  Rails.application.config.external_assets = Hash.new
  external_assets_data = YAML.load(File.open external_assets_file)
  if external_assets_data
    external_assets_data.each do |key, value|
      if key == Rails.env
        value.each do |env_key, env_value|
          Rails.application.config.external_assets[env_key] = env_value
        end
      else
        Rails.application.config.external_assets[key] = value
      end
    end
  end
end
