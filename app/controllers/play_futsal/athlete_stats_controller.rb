require_dependency "play_futsal/application_controller"

module PlayFutsal
  class AthleteStatsController < ApplicationController

    before_filter :get_data, only: [:increment, :decrement]

    def increment
    end

    def decrement
    end

    protected

      def get_data
        @athlete_stat = AthleteStat.find params[:id]
        @stat_name    = params[:stat]
      end
  end
end