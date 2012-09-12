module PlayFutsal
  class EventType < ActiveRecord::Base

    #### Relations ####

    has_many :match_events


    #### Accessors ####

    attr_accessible :name
  end
end
