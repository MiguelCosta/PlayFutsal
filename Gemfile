source "http://rubygems.org"
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

# To use debugger
# gem 'debugger'
group :development do
  gem 'execjs'
  gem 'therubyracer'
  gem 'debugger'
  gem 'pry-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl'
  gem 'faker'
end

group :production do
  gem 'thin'
  gem 'pg'
end

group :assets do
  gem 'uglifier'
end

gem 'play_auth', :git => 'git@github.com:naps62/PlayAuth.git'

gem 'sass-rails'
gem 'coffee-rails'

gem 'uglifier'
gem 'jquery-datatables-rails'
