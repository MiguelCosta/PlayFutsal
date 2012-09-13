module PlayFutsal
  class Event < ActiveRecord::Base

    #### Relations ####

    belongs_to :match
    belongs_to :event_type
    belongs_to :athlete
    belongs_to :other_athlete, :class_name => :athlete


    #### Accessors ####

    attr_accessible :minute,
                    :desc,
                    :athlete_id,
                    :event_type_id
  end
end
