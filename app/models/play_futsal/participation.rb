module PlayFutsal
  class Participation < ActiveRecord::Base

    #### Relations ####

    #belongs_to :match, :dependent => :destroy
    belongs_to :match
    belongs_to :team


    #### Accessors ####

    attr_accessible :team_id,
                    :team,
                    :match,
                    :goals,
                    :yellow_cards,
                    :red_cards


    #### Scopes ####
    default_scope -> { order 'id ASC' }

    #### Validators ####

    validate :team, :uniqueness => { :scope => :match_id }


    #### Methods ####
    def increment(stat)
      self.update_attribute(stat, self.send(stat)+1)
    end


    def decrement(stat)
      self.update_attribute(stat, self.send(stat)-1)
    end


    def commit
      [:goals, :yellow_cards, :red_cards].each do |stat|
        value = self.send(stat)
        self.team.add_to_stat(stat, value)
      end
    end

    def athletes_stats
      AthleteStat.by_match(self.match_id).by_team(self.team_id)
    end

  end
end
