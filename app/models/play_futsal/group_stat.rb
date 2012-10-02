module PlayFutsal
  class GroupStat < ActiveRecord::Base
    
    #### Relations ####

    belongs_to :team
    belongs_to :group


    #### Accessors ####

    attr_accessible :goals
  end
end
