class Country < ActiveRecord::Base
  has_many :federations
  attr_accessible :name
end
