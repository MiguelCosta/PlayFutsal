module PlayFutsal
  class Group < ActiveRecord::Base

    #### Relations ####

    has_many :teams
    has_many :matches


    #### Accessors ####

    attr_accessible :teams,
                    :matches,
                    :name

  end
end
