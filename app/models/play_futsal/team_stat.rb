module PlayFutsal
  class TeamStat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match, :dependent => :destroy
    belongs_to :team


    #### Accessors ####

    attr_accessible :match,
                    :team,
                    :fouls,
                    :goals

  end
end
