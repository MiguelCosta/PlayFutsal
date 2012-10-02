module PlayFutsal
  class Team < ActiveRecord::Base

    #### Relations ####

    has_many :athletes

    # has_one :group through :group_stat
    has_one :group_stat
    has_one :group, :through => :group_stat

    ## since matches define home_team and away_team, this is not a trivial relation. Has to be broken into 2

    # has many :matches and :match_stats
    has_many :match_stats
    has_many :matches, :through => :match_stats
    #has_many :home_matches, :class_name => 'PlayFutsal::Match', :foreign_key => :home_team_id
    #has_many :away_matches, :class_name => 'PlayFutsal::Match', :foreign_key => :away_team_id

    #has_many :team_stats


    #### Accessors ####

    # visible fields
    attr_accessible :athletes,
                    :matches,
                    :match_stats,
                    :group,
                    :group_stats,
                    :team_stats,
                    :name,
                    :goals,
                    :fouls


    #### Methods ####
    def matches
      Match.by_team(self)
    end

  end
end
