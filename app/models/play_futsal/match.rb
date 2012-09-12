module PlayFutsal
  class Match < ActiveRecord::Base
    
    #### Relations ####

    belongs_to :home_team, :class_name => 'PlayFutsal::Team'
    belongs_to :away_team, :class_name => 'PlayFutsal::Team'

    has_many :events


    #### Accessors ####
    
    attr_accessible :home_team_id,
                    :away_team_id,
                    :home_team,
                    :away_team,
                    :events,
                    :home_score,
                    :away_score,
                    :desc,
                    :datetime
  end
end
