$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "play_futsal/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "play_futsal"
  s.version     = PlayFutsal::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PlayFutsal."
  s.description = "TODO: Description of PlayFutsal."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "launchy"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl"
end
