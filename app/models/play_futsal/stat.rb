module PlayFutsal
  class Stat < ActiveRecord::Base

    #### Relations ####

    belongs_to :match
    belongs_to :athlete


    #### Accessors ####

    attr_accessible :fouls, :goals, :match, :athlete
  end
end
