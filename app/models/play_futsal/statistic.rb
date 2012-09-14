module PlayFutsal
  class Statistic < ActiveRecord::Base
    belongs_to :athlete
    belongs_to :match
    attr_accessible :faults, :goals
  end
end
