module PlayFutsal
  class Federation < ActiveRecord::Base
  	
  	has_many :user
  	
    attr_accessible :country, :name
  end
end
