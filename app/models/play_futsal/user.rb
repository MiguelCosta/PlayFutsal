module PlayFutsal
  class User < PlayFutsal.user_class.classify.constantize
    
    #### Relations ####
    
    has_one :athlete

  end
end
