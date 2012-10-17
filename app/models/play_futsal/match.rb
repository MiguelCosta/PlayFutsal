module PlayFutsal
  class Match < ActiveRecord::Base

    #### Relations ####

    belongs_to :phase
    belongs_to :group

    has_many :events, :dependent => :destroy
    has_many :athlete_stats

    has_many :participations, :class_name =>'PlayFutsal::Participation'
    has_many :teams, :through => :participations

    def home_team
      self.participations.first.team
    end

    def away_team
      self.participations.last.team
    end


    #### Accessors ####
    
    attr_accessible :phase_id,
                    :events,
                    :participations,
                    :teams,
                    :athlete_stats,
                    :home_team_stats,
                    :away_team_stats,
                    :started,
                    :finished,
                    :desc,
                    :datetime


    #### Validators ####

    validates :desc, :presence => true
    validate :has_two_participations
    validate :participants_are_different

    def has_two_participations
      errors.add(:participations, "Two teams are required") if self.participations.count == 2
    end

    def participants_are_different
      errors.add(:participations, "Teams can't be the same") if home_team == away_team
    end



    #### Scopes ####

    # matches belonging to a group
    scope :in_group, lambda { where "group_id IS NOT NULL" }

    scope :by_team, lambda  { |t| where "home_team_id = ? OR away_team_id = ?", t.id, t.id }

    # match completion state
    scope :not_started, lambda { where :started  => false }
    scope :started,     lambda { where :started  => true  }
    scope :finished,    lambda { where :finished => true  }


    # callback for creating a stats record
    # for each player and team associated with this match
    def begin
        if !started
            self.started = true
            ActiveRecord::Base.transaction do
                #Home Team
                self.home_team.athletes.each do |athlete|
                    self.athlete_stats.create :athlete => athlete
                end

                #Away Team
                self.away_team.athletes.each do |athlete|
                    self.athlete_stats.create :athlete => athlete
                end
                
            end
        end
    end

    # callback to commit a stats record
    def finish
        debugger
        if !finished
            self.finished = true
            ActiveRecord::Base.transaction do
                self.athlete_stats.each do |athlete_stat|
                    athlete_stat.athlete.increment_stat(:goals, athlete_stat.goals)
                    athlete_stat.athlete.increment_stat(:fouls, athlete_stat.fouls)
                    athlete_stat.athlete.save
                end

                self.participations.first.increment_all_stat
                self.participations.last.increment_all_stat
            end
        end
    end


    def athletes
        athletes = []
        athletes << self.home_team.athletes if self.home_team
        athletes << self.away_team.athletes if self.away_team
        athletes.flatten
    end


    def desc_with_goals
        "#{self.desc} (#{self.goals})"
    end
    
    def add_participations(home_id, away_id)
      self.participations.build [{:team_id => home_id}, {:team_id => away_id}]
    end


    #### Private Methods ####
    protected

      def must_start_before_finish
        if finished == true && started == false
          errors.add :started, "Match has to start before it can finish"
        end
      end

  end
end
