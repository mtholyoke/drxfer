source 'http://rubygems.org'

gem 'rails', '3.1.10'
gem 'rake', '10.0.3'

gem "devise", "~> 2.2.3"
gem "devise_ldap_authenticatable"

gem 'carrierwave'

gem 'capistrano'

gem 'exception_notification'

gem 'nested_form', :git => "git://github.com/ryanb/nested_form.git"
# (See https://github.com/ryanb/nested_form/issues/95#issuecomment-2187551)

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', " ~> 3.1.7"
  gem 'coffee-rails', " ~> 3.1.1"
  gem 'uglifier'
end

gem 'jquery-rails'
