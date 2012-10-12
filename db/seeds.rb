puts 'PlayFutsal: Creating roles'

['FutsalAdmin', 'FutsalAthlete'].each do |role|
  PlayFutsal::Role.create :name => role
end

['goal', 'foul'].each do |name|
  PlayFutsal::EventType.find_or_create_by_name(name)
end