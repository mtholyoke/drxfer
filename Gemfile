source 'http://rubygems.org'

gem 'rails', '3.1.12'
gem 'rake', '10.0.3'

gem "devise", "2.2.3"
gem "devise_ldap_authenticatable", "~> 0.6.1"

gem 'carrierwave', "~> 0.5.8"

gem 'capistrano', "~> 2.14.2"

gem 'exception_notification', "~> 3.0.1"

gem 'json', '1.7.7'

gem 'nested_form', "~> 0.2.1"
# (See https://github.com/ryanb/nested_form/issues/95#issuecomment-2187551)

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', " ~> 2.13"
  gem 'factory_girl', " ~> 2.6.4"
  gem 'factory_girl_rails', " ~> 1.7"
end

group :production do
  gem 'pg', "~> 0.15.0"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', " ~> 3.1.7"
  gem 'coffee-rails', " ~> 3.1.1"
  gem 'uglifier', "~> 1.3.0"
end

gem 'jquery-rails'
