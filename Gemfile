source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.2.0'
gem 'awesome_print'
gem 'bcrypt'
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'mysql2'
gem 'sass-rails'
gem 'uglifier'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
