module PlayFutsal
  class Group < ActiveRecord::Base

    #### Relations ####

    has_many :group_stats
    has_many :teams, :through => :group_stats, :order => "position"

    has_many :matches


    #### Accessors ####

    attr_accessible :name

    # retrieves all group data for each team
    # def teams_data
    #   group.teams.map do |team|
    #     {
    #       team:    team,
    #       matches: team.matches.in_group.count,
    #       wins:    team.matches.won_by(team).count,
    #       draws:   team.matches.draws.count,
    #       losses:  team.matches.losses.count,
    #       goals_scored:   team.matches.
    #       goals_suffered: team.matches.
    #     }
    #   end
    # end

    def refresh_positons
        pos = 1
        # Há alguma forma de melhorar este método? fazer um map talvez...
        gamesStats = GroupStat.find_all_by_group_id(self.id, :order => "points DESC")
        gamesStats.each do |gameStat|
            gameStat.update_attribute(:position, pos)
            pos += 1
        end
    end

  end
end
