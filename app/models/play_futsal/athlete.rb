module PlayFutsal
  class Athlete < ActiveRecord::Base

    # Is associated with a user record
    belongs_to :user

    #### Relations ####

    # Belongs to a single team
    belongs_to :team


    #### Validations ####
    validates_uniqueness_of :number, :scope => :team_id


    ##### Accessors ####

    # visible fields
    attr_accessible :number, :user
  end
end
