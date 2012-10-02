module PlayFutsal
  class TeamStat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match, :dependent => :destroy
    belongs_to :team, :dependent => :destroy


    #### Accessors ####

    attr_accessible :fouls,
                    :goals

  end
end
