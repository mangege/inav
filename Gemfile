source 'https://rubygems.org'
#source 'http://ruby.taobao.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'metro-ui-rails-cn', '~> 0.1.6'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "rest-client", "~> 1.6.7"
gem "oauth2", "~> 0.8.0"
gem "thin", "~> 1.5.0"
gem "rails-i18n", "~> 0.7.0"
gem "enumerize", "~> 0.5.0"

group :development do
  gem "magic_encoding", "~> 0.0.2"
end

group :test do
  gem 'simplecov', :require => false
  gem "webmock", "~> 1.8.11"
  gem "mocha", "~> 0.12.7", :require => false
end

group :development, :test do
  gem "factory_girl_rails", "~> 4.0"
end
