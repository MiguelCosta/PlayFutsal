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
                    :position,
                    :matches_played


    #### Scopes ####
    default_scope order('position ASC')
    
    #### Methods ####

    def move_up
      @other = GroupStat.find_by_group_id_and_position(self.group_id, self.position + 1)
      @other.update_attribute(:position, self.position)
      self.update_attribute(:position, self.position + 1)
    end

    def move_down
      @other = GroupStat.find_by_group_id_and_position(self.group_id, self.position - 1)
      @other.update_attribute(:position, self.position)
      self.update_attribute(:position, self.position - 1)
    end

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


    def refresh_group_stat(local,home_goals, away_goals)

      diff_goals = home_goals - away_goals
      params = {}

      case local
        when "home"
          params[:goals_for_home] = self.goals_for_home + home_goals
          params[:goals_against_home] = self.goals_against_home + away_goals
          params[:wins_home] = self.wins_home + 1 if diff_goals > 0
          params[:draws_home] = self.draws_home + 1 if diff_goals == 0
          params[:losses_home] = self.losses_home + 1 if diff_goals < 0

        when "away"
          params[:goals_for_away] = self.goals_for_away + away_goals
          params[:goals_against_away] = self.goals_against_away + home_goals
          params[:losses_away] = self.losses_away + 1 if diff_goals > 0
          params[:draws_away] = self.draws_away + 1 if diff_goals == 0
          params[:wins_away] = self.wins_away + 1 if diff_goals < 0
      end
      #params[:points] = calc_points

      self.update_attributes(params)
      # tentar ver como é que se pode fazer isto no
      # mesmo update, o que está a acontecer é que para calcular os pontos
      # ele precisa de já ter as vitórias guardadas...
      self.update_attributes(:points => calc_points, 
                             :matches_played => self.wins + self.draws + self.losses)
    end


    private

    def calc_points
      (wins*3) + draws
    end

  end
end
