namespace :play_futsal do
  namespace :db do
    desc "Erase and fill database"

    task :populate => :environment do
      require 'populator'
      require 'faker'

      # delete old records first
      [PlayFutsal::User, PlayFutsal::Athlete, PlayFutsal::Team, PlayFutsal::Match, PlayFutsal::Group].each(&:delete_all)

      # create roles
      ['FutsalAdmin', 'FutsalAthlete'].each do |role|
        PlayFutsal::Role.find_or_create_by_name role
      end

      # create my user
      PlayFutsal::User.populate 1 do |user|
        user.first_name = "Miguel"
        user.last_name  = "Palhas"
        user.email      = "mpalhas@gmail.com"
        user.password_salt = "8CiqeX9BR3spXvmqo26s" # salt for "mpalhas"
        user.roles     << PlayFutsal::Role.find_by_name('FutsalAdmin')
      end

      # create users
      PlayFutsal::User.populate 10 do |user|
        name = Faker::Name.name.split
        user.first_name = name[0]
        user.last_name  = name[1]
        user.email      = Faker::Internet.email
        user.password_salt   = user.first_name

        user_ids.push user.id

        user.role_id << PlayFutsal::Role.find_by_name('FutsalAthlete').id
      end

      # all athlete user ids
      user_ids = PlayFutsal::Role.find_by_name('FutsalAthlete').users.map(&:id)


      # create groups
      name = ('A'.ord - 1).chr # the one just before 'A'
      PlayFutsal::Group.populate 8 do |group|
        group.name = name.next!

        # 4 teams per group
        PlayFutsal::Team.populate 4 do |team|
          team.name = Faker::Company.name

          # 5 athletes per team
          number = 0
          PlayFutsal::Athlete.populate 5 do |athlete|
            athlete.number  = number.next!
            athlete.user_id = user_ids.pop
          end
        end
      end

    end
  end
end