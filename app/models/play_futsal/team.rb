module PlayFutsal
  class Team < ActiveRecord::Base

    #### Relations ####

    has_many :athletes
    # has_one :group through :group_stat
    has_one :group_stat
    has_one :group, :through => :group_stat
    ## since matches define home_team and away_team, this is not a trivial relation. Has to be broken into 2
    # has many :matches and :match_stats
    has_many :participations
    has_many :matches, :through => :participations

    #has_many :team_stats


    #### Accessors ####

    # visible fields
    attr_accessible :athletes,
                    :matches,
                    :match_stats,
                    :group,
                    :group_stat,
                    :team_stats,
                    :name,
                    :goals,
                    :fouls


    #### Scopes ####

    default_scope order('id ASC')

    scope :by_group, lambda { |group|   joins(:group_stat).where('play_futsal_group_stats.group_id' => group.id) }
    scope :by_team,  lambda { |team_id| joins(:athlete).where('play_futsal_athletes.team_id'  => team_id) }

    scope :not_in_group, {
        :joins      => "LEFT JOIN play_futsal_group_stats ON play_futsal_teams.id = play_futsal_group_stats.team_id",
        :conditions => "play_futsal_group_stats.team_id IS NULL",
        :select     => "DISTINCT play_futsal_teams.*" }


    #### Methods ####

    def add_to_stat(stat, val)
      self.update_attribute(stat, val + self.send(stat))
    end

    def to_s
      name
    end

  end
end
