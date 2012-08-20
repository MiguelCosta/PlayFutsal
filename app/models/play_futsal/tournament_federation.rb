module PlayFutsal
  class TournamentFederation < ActiveRecord::Base
    belongs_to :tournament
    belongs_to :federation
    attr_accessible :federation_id, :tournament_id
  end
end
