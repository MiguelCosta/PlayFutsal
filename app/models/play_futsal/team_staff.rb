module PlayFutsal
  class TeamStaff < ActiveRecord::Base
    belongs_to :team
  end
end
