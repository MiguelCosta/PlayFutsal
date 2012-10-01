puts 'PlayFutsal: Creating roles'

['FutsalAdmin', 'FutsalAthlete'].each do |role|
  PlayFutsal::Role.create :name => role
end