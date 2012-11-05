module PlayFutsal
  class AthleteStat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match
    belongs_to :athlete


    #### Accessors ####

    attr_accessible :match,
      :athlete,
      :goals,
      :yellow_cards,
      :red_cards


    #### Scopes ####
    default_scope -> { order 'id ASC' }

    scope :by_match, lambda { |match_id| where :match_id => match_id }
    scope :by_team,  lambda { |team_id|  joins(:athlete).where('play_futsal_athletes.team_id'  => team_id) }

    #### Methods ####

    # get the team participation of the corresponding match
    def team_participation
      Participation.find_by_team_id_and_match_id(self.athlete.team.id, self.match.id)
    end

    def increment(stat)
      self.update_attribute(stat, self.send(stat)+1)
    end


    def decrement(stat)
      self.update_attribute(stat, self.send(stat)-1)
    end


    def commit
      [:goals, :yellow_cards, :red_cards].each do |stat|
        value = self.send(stat)
        self.athlete.add_to_stat(stat, value)
      end
    end

  end
end
