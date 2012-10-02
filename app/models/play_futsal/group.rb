module PlayFutsal
  class Group < ActiveRecord::Base

    #### Relations ####

    has_many :group_stats
    has_many :teams, :through => :group_stats

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

  end
end
