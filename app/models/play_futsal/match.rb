module PlayFutsal
  class Match < ActiveRecord::Base

    def initialize(*args)
      super
      build_participations
    end

    #### Relations ####

    belongs_to :phase
    belongs_to :group

    has_many :events, :dependent => :destroy
    has_many :athlete_stats

    has_many :participations, :dependent => :destroy, :class_name =>'PlayFutsal::Participation'
    has_many :teams, :through => :participations

    accepts_nested_attributes_for :participations

    def home
      self.participations.order('id ASC').first
    end

    def away
      self.participations.last
    end

    #### Callbacks ####
    #after_save :create_participations


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
                    :datetime,
                    :group_id,
                    :phase_id,
                    :participations_attributes


    #### Validators ####

    validates :desc, :presence => true


    #### Scopes ####

    default_scope -> { order 'datetime ASC' }

    # matches belonging to a group
    scope :in_group, lambda { where "group_id IS NOT NULL" }

    scope :by_team, lambda  { |t| where "home_team_id = ? OR away_team_id = ?", t.id, t.id }

    # match completion state
    scope :not_started, lambda { where :started  => false }
    scope :started,     lambda { where :started  => true  }
    scope :finished,    lambda { where :finished => true  }


    def in_progress?
      started? and not finished?
    end

    #### Methods ####

    def build_participations
      if self.participations.size != 2
        self.participations.build
        self.participations.build
      end
    end

    def set_teams(home_team_id, away_team_id)
      self.home.update_attributes(team_id: home_team_id)
      self.away.update_attributes(team_id: away_team_id)
    end

    # callback for creating a stats record
    # for each player and team associated with this match
    def begin
      if !started
        self.update_attribute :started, true
        # Create one record for each athlete
        self.athletes.each do |athlete|
          self.athlete_stats.create :athlete => athlete
        end
      end
    end

    # callback to commit a stats record
    def finish
      if !finished
        # ver como se coloca aqui uma transaction, caso contrário se der erro
        # algmas coisas ficam na mesma inseridas na BD
        self.update_attribute :finished, true
        self.athlete_stats.map  &:commit
        self.participations.map &:commit
        self.refresh_group_stat
      end
    end

    def athletes
      athletes = []
      athletes << self.home.team.athletes if self.home.team
      athletes << self.away.team.athletes if self.away.team
      athletes.flatten
    end

    def add_participations(home_id, away_id)
      self.participations.build [{:team_id => home_id}, {:team_id => away_id}]
    end

    def home_athletes_stats
      AthleteStat.by_match(self).by_team(self.home.team)
    end

    def away_athletes_stats
      AthleteStat.by_match(self).by_team(self.away.team)
    end

    def to_s
      to_s = if self.started?
        "#{self.desc} | #{home.to_s(true)} - #{away.to_s(false)}"
      else
        "#{self.desc} | #{home.to_s} vs #{away.to_s}"
      end
    end

    def win
      if home.goals > away.goals
        "H"
      elsif home.goals < away.goals
        "A"
      else
        "D"
      end
    end

    #### Private Methods ####
    protected

    def must_start_before_finish
      if finished == true && started == false
        errors.add :started, "Match has to start before it can finish"
      end
    end

    def refresh_group_stat
      if self.group_id
        debugger
        gsHome = GroupStat.find_by_group_id_and_team_id(self.group_id, self.home.team.id)
        gsHome.refresh_group_stat("home", home.goals, away.goals)

        gsAway = GroupStat.find_by_group_id_and_team_id(self.group_id, self.away.team.id)
        gsAway.refresh_group_stat("away", home.goals, away.goals)

        g = Group.find_by_id(group_id)
        g.refresh_positons
      end
    end


  end
end
