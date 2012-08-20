module PlayFutsal
  class TeamReferee < ActiveRecord::Base
    belongs_to :federation
  end
end
