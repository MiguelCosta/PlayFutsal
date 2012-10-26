source "http://rubygems.org"

# Declare your gem's dependencies in play_futsal.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

gem 'squeel'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
group :development do
  gem 'execjs'
  gem 'therubyracer'
  gem 'debugger'
  gem 'awesome_print'
end

group :development, :test do
  gem 'factory_girl'
  gem 'faker'
end

group :assets do
  gem 'uglifier'
end

gem 'play_auth', :git => 'git@github.com:naps62/PlayAuth.git'