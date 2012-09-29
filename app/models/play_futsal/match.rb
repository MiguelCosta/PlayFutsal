module PlayFutsal
  class Match < ActiveRecord::Base

    #### Relations ####

    belongs_to :home_team, :class_name => 'PlayFutsal::Team'
    belongs_to :away_team, :class_name => 'PlayFutsal::Team'
    belongs_to :group

    has_many :events
    has_many :athlete_stats
    has_one :home_team_stats, :class_name =>'PlayFutsal::TeamStat', :foreign_key => :team_id
    has_one :away_team_stats, :class_name =>'PlayFutsal::TeamStat', :foreign_key => :team_id


    #### Accessors ####
    
    attr_accessible :home_team,
                    :away_team,
                    :home_team_id,
                    :away_team_id,
                    :events,
                    :athlete_stats,
                    :home_team_stats,
                    :away_team_stats,
                    :desc,
                    :datetime,
                    :home_team_id,
                    :away_team_id


    #### Scopes ####



    #### Validators ####

    validate  :teams_cant_be_equal


    #### Callbacks ####

    # callback for creating a stats record
    # for each player and team associated with this match
    def create_match_stats
      ActiveRecord::Base.transaction do
        #Home Team
        self.home_team.athletes.each do |athlete|
          self.athlete_stats.create :athlete => athlete
        end
        self.create_home_team_stats :team => home_team

        #Away Team
        self.away_team.athletes.each do |athlete|
          self.athlete_stats.create :athlete => athlete
        end
        self.create_away_team_stats :team => away_team
      end
    end


    #### Private Methods ####
    private

    # guarantees that the two teams are not the same
    def teams_cant_be_equal
      if home_team == away_team
        errors.add(:base, "teams can't be equal")
      end
    end

    
  end
end
