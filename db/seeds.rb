puts 'PlayFutsal: Creating roles'

# ['FutsalAdmin', 'FutsalAthlete'].each do |role|
#   PlayFutsal.roles_class.create :name => role
# end

if Rails.env.development?
  puts 'PlayFutsal: Adding test users'

  user = PlayAuth::User.find_or_create_by_email   :first_name => 'Atleta',
                                                  :last_name  => 'Ateleta',
                                                  :email      => 'atleta@gmail.com',
                                                  :password   => 'atleta'

  #user.roles << PlayFutsal.roles_class.find_by_name('FutsalAdmin')

  puts 'PlayFutsal: Adding teams'

  team = PlayFutsal::Team.find_or_create_by_name  :name   => 'Universidade do Minho'
  team = PlayFutsal::Team.find_or_create_by_name  :name   => 'Universidade de Aveiro'
  team = PlayFutsal::Team.find_or_create_by_name  :name   => 'Universidade de Coimbra'
end

# puts 'PlayFutsal: Adding all users with role PlayFutsal to PlayFutsal::Athlete'
# PlayAuth::Role.find_by_name('FutsalAthlete').users.map do |user|
#   PlayFutsal::Athlete.create :user_id => user.id
# end