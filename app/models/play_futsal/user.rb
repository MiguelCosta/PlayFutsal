module PlayFutsal
  class User < PlayFutsal.user_class.classify.constantize
    
    #### Relations ####
    
    # Link to record in FutsalAthlete table
    has_one :futsal_athlete, :class_name => 'PlayFutsal::Athlete'

  end
end
