require_dependency "play_futsal/application_controller"

module PlayFutsal
  class PagesController < ApplicationController
    
    def home
      @matchesLive = Match.find_all_by_started_and_finished(true, false)

      @matchesLast = Match.find_all_by_started_and_finished(true, true,
                                                            :order => "datetime DESC",
                                                            :limit => '5')
      
      @matchesNext = Match.find_all_by_started_and_finished(false, false,
                                                            :order => "datetime ASC", 
                                                            :limit => '5')
    end

  end
end
