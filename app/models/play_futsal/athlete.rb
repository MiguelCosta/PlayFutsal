module PlayFutsal
  class Athlete < ActiveRecord::Base

    # Is associated with a user record
    belongs_to :user

    #### Relations ####

    # Belongs to a single team
    belongs_to :team


    ##### Accessors ####

    # visible fields
    attr_accessible :number
  end
end
