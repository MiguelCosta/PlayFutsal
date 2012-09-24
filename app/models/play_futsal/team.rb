module PlayFutsal
  class Team < ActiveRecord::Base

    #### Relations ####

    belongs_to :federation
    belongs_to :group

    has_many :athletes
    has_many :coaches
    has_many :matches

    has_many :team_stats


    #### Accessors ####

    # visible fields
    attr_accessible :group,
                    :athletes,
                    :matches,
                    :team_stats,
                    :name

  end
end
