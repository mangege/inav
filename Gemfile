source 'https://rubygems.org'
#source 'http://ruby.taobao.org'

gem 'rails', '3.2.10'

gem 'mysql2'

gem 'jquery-rails'
gem 'simple_form'

gem "rest-client", "~> 1.6.7"
gem "oauth2", "~> 0.8.0"
gem "puma", "~> 1.6.3"
gem "rails-i18n", "~> 0.7.0"
gem "enumerize", "~> 0.5.0"
gem "liquid", "~> 2.4.1"
gem "sidekiq", "~> 2.6.0"
gem "nokogiri", "~> 1.5.6"
gem "kaminari", "~> 0.14.1"
gem "settingslogic", "~> 2.0.9"
gem "exception_notification", "~> 3.0.0"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
end

group :development do
  gem "magic_encoding", "~> 0.0.2"
end

group :auto_test do
  #auto test http://railsgotchas.wordpress.com/2011/12/16/testing-with-spork-guard-and-testunit/
  gem "guard-test", "~> 0.7.0"
  gem "guard-shell", "~> 0.5.1"
  gem 'rb-inotify', :require => false
  #gem 'libnotify' #terminal title only
end

group :test do
  gem 'simplecov', :require => false
  gem "webmock", "~> 1.8.11"
  gem "mocha", "~> 0.12.7", :require => false
end

group :development, :test do
  gem "factory_girl_rails", "~> 4.0"
end
