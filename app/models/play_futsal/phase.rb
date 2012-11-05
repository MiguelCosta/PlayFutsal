module PlayFutsal
  class Phase < ActiveRecord::Base

    #### Relations ####

    has_many :matches


    #### Accessors ####

    attr_accessible  :name,
                     :position


    #### Scopes ####
    default_scope order('position ASC')

  end
end
