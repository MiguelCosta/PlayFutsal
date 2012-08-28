module PlayFutsal
  class Team < ActiveRecord::Base

    #### Relations ####

    belongs_to :federation

    has_many :athletes
    has_many :coaches
    has_many :matches


    #### Accessors ####

    # visible fields
    attr_accessible :name

  end
end
