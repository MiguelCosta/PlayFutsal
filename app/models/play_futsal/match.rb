module PlayFutsal
  class Match < ActiveRecord::Base
    
    #### Relations ####

    belongs_to :home_team, :class_name => :team
    belongs_to :away_team, :class_name => :team


    #### Accessors ####
    
    attr_accessible :home_score,
                    :away_score,
                    :desc,
                    :datetime
  end
end
