module PlayFutsal
  class Participation < ActiveRecord::Base

    #### Relations ####

    #belongs_to :match, :dependent => :destroy
    belongs_to :match
    belongs_to :team, :dependent => :destroy


    #### Accessors ####

    attr_accessible :team_id,
                    :fouls,
                    :goals,
                    :team

  end
end
