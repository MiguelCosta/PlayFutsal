module PlayFutsal
  class Phase < ActiveRecord::Base

    #### Relations ####

    has_many :matches


    #### Accessors ####

    attr_accessible  :name,
                     :order


    #### Methods ####

    def to_s
      name
    end
  end
end
