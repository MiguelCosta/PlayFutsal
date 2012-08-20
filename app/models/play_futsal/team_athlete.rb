module PlayFutsal
  class TeamAthlete < ActiveRecord::Base
    belongs_to :team
  end
end
