module PlayFutsal
  
  puts 'PlayFutsal: Creating roles'
  
  ['FutsalAdmin', 'FutsalAthlete'].each do |role|
    Role.create :name => role
  end

  if Rails.env.development?
    puts 'PlayFutsal: Adding test users'
    user = PlayAuth::User.create :first_name => 'Atleta',
                                 :last_name  => 'Ateleta',
                                 :email      => 'atleta@gmail.com',
                                 :password   => 'atleta'

    user.roles << Role.find_by_name('FutsalAdmin')
  end

  puts 'PlayFutsal: Adding all users with role PlayFutsal to PlayFutsal::Athlete'
  Role.find_by_name('FutsalAthlete').users.map do |user|
    Athlete.create :user_id => user.id
  end

end
