module PlayFutsal
  class Athlete < ActiveRecord::Base

    #### Relations ####

    belongs_to :user
    belongs_to :team

    has_many :athlete_stats

    # Has multiple events, and in some of them he is a secondary athlete
    has_many :events, :primary_key => :athlete_id
    has_many :other_events, :primary_key => :other_athlete_id


    #### Validations ####
    validates_uniqueness_of :number, :scope => :team_id, :allow_nil => true
    validates_uniqueness_of :user_id


    ##### Accessors ####

    # visible fields
    attr_accessible :user,
                    :team,
                    :athlete_stats,
                    :number,
                    :user,
                    :user_id,
                    :team_id,
                    :goals,
                    :fouls,
                    :athlete_stats


    ##### Methods ####
    def name 
        self.user.name
    end 

  end
end
