module PlayFutsal
  class Athlete < ActiveRecord::Base

    #### Relations ####
    # Is associated with a user record
    belongs_to :user

    # Belongs to a single team
    belongs_to :team


    #### Validations ####
    validates_uniqueness_of :number, :scope => :team_id
    validates_uniqueness_of :user_id


    ##### Accessors ####

    # visible fields
    attr_accessible :user_id, :team_id, :number, :user, :team


    ##### Methods ####
    def name 
        self.user.name
    end 

  end
end
