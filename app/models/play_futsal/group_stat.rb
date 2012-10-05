module PlayFutsal
  class GroupStat < ActiveRecord::Base
    
    #### Relations ####

    belongs_to :team
    belongs_to :group


    #### Accessors ####

    attr_accessible :team_id,
                    :group_id,
                    :wins_home,
                    :wins_away,
                    :draws_home,
                    :draws_away,
                    :losses_home,
                    :losses_away,
                    :goals_for_home,
                    :goals_for_away,
                    :goals_against_home,
                    :goals_against_away,
                    :points,
                    :position


    #### Methods ####

    def wins
      wins_home + wins_away
    end

    def draws
      draws_home + draws_away
    end

    def losses
      losses_home + losses_away
    end

    def goals_for
      goals_for_home + goals_for_away
    end

    def goals_against
      goals_against_home + goals_against_away
    end

    def goal_difference
      goals_for - goals_against
    end

  end
end
