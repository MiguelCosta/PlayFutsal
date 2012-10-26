module PlayFutsal
  class AthleteStat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match
    belongs_to :athlete


    #### Accessors ####

    attr_accessible :match,
                    :athlete,
                    :fouls,
                    :goals

  end
end
