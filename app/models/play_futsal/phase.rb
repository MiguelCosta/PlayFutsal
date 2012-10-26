module PlayFutsal
  class Phase < ActiveRecord::Base

    #### Relations ####

    has_many :matches


    #### Accessors ####

    attr_accessible  :name,
                     :order

  end
end
