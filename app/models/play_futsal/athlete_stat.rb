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

    scope :by_match, lambda { |match| where :match_id => match.id }
    scope :by_team,  lambda { |team|  joins(:athlete).where('play_futsal_athletes.team_id'  => team.id) }

  end
end
