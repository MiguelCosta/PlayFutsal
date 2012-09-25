module PlayFutsal
  class Team < ActiveRecord::Base

    #### Relations ####

    belongs_to :federation
    belongs_to :group

    has_many :athletes
    has_many :coaches

    # since matches define home_team and away_team, this is not a trivial relation. Has to be broken into 2
    has_many :home_matches, :class_name => 'PlayFutsal::Match', :foreign_key => :home_team_id
    has_many :away_matches, :class_name => 'PlayFutsal::Match', :foreign_key => :away_team_id

    has_many :team_stats


    #### Accessors ####

    # visible fields
    attr_accessible :group,
                    :athletes,
                    :matches,
                    :team_stats,
                    :name,
                    :goals,
                    :fouls


    #### Methods ####
    def matches
      home_matches + away_matches
    end

  end
end
