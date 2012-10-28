source "http://rubygems.org"
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

gem 'squeel'

# To use debugger
# gem 'debugger'
group :development do
  gem 'execjs'
  gem 'therubyracer'
  gem 'debugger'
  gem 'pry-rails'
end

group :development, :test do
  gem 'factory_girl'
  gem 'faker'
end

gem 'sqlite3', :group => [:development, :test]
group :production do
  gem 'thin'
  gem 'pg'
end

group :assets do
  gem 'uglifier'
end

gem 'play_auth', :git => 'git@github.com:naps62/PlayAuth.git'
