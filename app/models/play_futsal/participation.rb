module PlayFutsal
  class Participation < ActiveRecord::Base

    #### Relations ####

    #belongs_to :match, :dependent => :destroy
    belongs_to :match
    belongs_to :team, :dependent => :destroy


    #### Accessors ####

    attr_accessible :team_id,
                    :fouls,
                    :goals,
                    :team


    #### Validators ####

    validate :team, :uniqueness => { :scope => :match_id }


    #### Methods ####
    def increment_all_stat
        self.team.update_attributes(:goals => self.team.goals + self.goals, :fouls => self.team.fouls + self.fouls)
    end

  end
end
