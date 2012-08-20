module PlayFutsal
  class Team < ActiveRecord::Base
  	belongs_to :federation

    attr_accessible :name, :federation_id
    
    #validates :name, :federation_id, presence => true
  end
end
