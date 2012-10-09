FactoryGirl.define do


  #### User
  factory :user, :class => 'PlayFutsal::User' do
    first_name   { Faker::Name.name.split()[0] }
    last_name    { Faker::Name.name.split()[1] }
    email        { Faker::Internet.email }
    password     { Faker::Internet.email }
    roles        [ PlayFutsal::Role.find_or_create_by_name('FutsalAthlete') ]

    factory :admin do
      first_name 'Miguel'
      last_name  'Palhas'
      email      'mpalhas@gmail.com'
      password   'mpalhas'

      roles [ PlayFutsal::Role.find_or_create_by_name('FutsalAdmin') ]
    end
  end


  #### Athlete
  factory :athlete, :class => 'PlayFutsal::Athlete' do
    user { FactoryGirl.build :user }
    sequence :number
  end


  #### Team
  factory :team, :class => 'PlayFutsal::Team' do
    name     { Faker::Company.name }

    factory :full_team do
      athletes { FactoryGirl.create_list :athlete, 2 }
    end
  end


  #### Group
  factory :group, :class => 'PlayFutsal::Group' do
    sequence(:name) { |n| ('A'.ord + n - 1).chr }

    factory :full_group do
      teams { FactoryGirl.create_list :full_team, 4 }

      # a group with full teams and a match between each 2 teams
      factory :full_group_with_matches do
        matches { |g|
          pairs = (0...(g.teams.size-1)).inject([]) {|pairs,x| pairs += ((x+1)...g.teams.size).map {|y| [g.teams[x],g.teams[y]]}}

          result = []
          pairs.each do |pair|
            puts "matching #{pair[0].name} with #{pair[1].name}"
            match = FactoryGirl.build :match
            match.participations << (PlayFutsal::Participation.create :team => pair[0])
            match.participations << (PlayFutsal::Participation.create :team => pair[1])
            result.push match
          end
          result
        }
      end
    end
  end


  #### Match
  factory :match, :class => 'PlayFutsal::Match' do
    sequence(:desc)
    datetime { 2.days.from_now..10.days.from_now }
  end

end