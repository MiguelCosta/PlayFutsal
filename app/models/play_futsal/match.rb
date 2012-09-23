module PlayFutsal
  class Match < ActiveRecord::Base
    
    #### Relations ####

    belongs_to :home_team, :class_name => 'PlayFutsal::Team'
    belongs_to :away_team, :class_name => 'PlayFutsal::Team'

    has_many :events
    has_many :stats

    #### Accessors ####
    
    attr_accessible :home_team_id,
                    :away_team_id,
                    :home_team,
                    :away_team,
                    :events,
                    :home_score,
                    :away_score,
                    :desc,
                    :datetime


    #### Validators ####

    validate  :teams_cant_be_equal


    #### Callbacks ####

    after_create :create_match_stats


    #### Private Methods ####
    private

    # guarantees that the two teams are not the same
    def teams_cant_be_equal
      if home_team == away_team
        errors.add(:base, "teams can't be equal")
      end
    end

    # callback for creating a stats record
    # for each player associated with this match
    def create_match_stats
      ActiveRecord::Base.transaction do
        self.home_team.athletes.each do |athlete|
          self.stats.create :athlete => athlete
        end
      end
    end
  end
end
