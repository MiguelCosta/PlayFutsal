module PlayFutsal
  class Tournament < ActiveRecord::Base
  	
  	# ver como fazer para os eventos
	# has_many :event
	has_many :tournament_federation
	has_many :federation, :through => :tournament_federation
  
    attr_accessible :name, :description
    
    #validates :description, :name, :presence => true
    
  end
end
