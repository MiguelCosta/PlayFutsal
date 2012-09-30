module PlayFutsal
  class AthleteStat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match, :dependent => :destroy
    belongs_to :athlete, :dependent => :destroy


    #### Accessors ####

    attr_accessible :match,
                    :athlete,
                    :fouls,
                    :goals

  end
end
