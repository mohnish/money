source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'awesome_print'
gem 'bcrypt'
gem 'jbuilder'
gem 'mysql2'
gem 'uglifier'
gem 'doorkeeper'
gem 'jquery-rails'
gem 'sass-rails'
gem 'bootstrap-sass'

gem 'sdoc', group: :doc

group :test, :development do
  gem 'factory_girl_rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'guard'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'byebug'
  gem 'web-console'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
