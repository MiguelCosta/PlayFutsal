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


    #### Scopes ####
    default_scope -> { order 'id ASC' }

    scope :without_team, -> { where :team_id => nil }


    ##### Methods ####
    def name 
        self.user.name
    end 

    def name_with_team
        "#{self.user.name} (#{self.team.name})"
    end

    def add_to_stat(stat, val)
        self.update_attribute(stat, val + self.send(stat))
    end

  end
end
