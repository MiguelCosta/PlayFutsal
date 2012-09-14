module PlayFutsal
  class Athlete < ActiveRecord::Base

    #### Relations ####

    # Is associated with a user record
    belongs_to :user

    # Belongs to a single team
    belongs_to :team

    # Has multiple events, and in some of them he is a secondary athlete
    has_many :events, :primary_key => :athlete_id
    has_many :other_events, :primary_key => :other_athlete_id


    #### Validations ####
    validates_uniqueness_of :number, :scope => :team_id
    validates_uniqueness_of :user_id


    ##### Accessors ####

    # visible fields
    attr_accessible :user_id, :team_id, :number, :user, :team,
                            :goals, :faults


    ##### Methods ####
    def name 
        self.user.name
    end 

  end
end
