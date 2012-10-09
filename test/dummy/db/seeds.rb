PlayAuth::Engine.load_seed
PlayFutsal::Engine.load_seed

require 'factory_girl'
require 'faker'

puts 'Generating test data. This might take a while...'
FactoryGirl.find_definitions
FactoryGirl.create_list :full_group_with_matches, 2