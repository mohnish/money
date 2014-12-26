source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'awesome_print'
gem 'bcrypt'
gem 'jbuilder'
gem 'mysql2'
gem 'uglifier'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'terminal-notifier-guard'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
