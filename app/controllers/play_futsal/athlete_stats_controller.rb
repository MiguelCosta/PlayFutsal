require_dependency "play_futsal/application_controller"

module PlayFutsal
  class AthleteStatsController < ApplicationController

    before_filter :get_data, only: [:increment, :decrement]

    def increment
      @athlete_stat.increment @stat_name
      @team_participation.increment @stat_name
      redirect_to :back
    end

    def decrement
      @athlete_stat.decrement @stat_name
      @team_participation.decrement @stat_name
      redirect_to :back
    end

    protected

      def get_data
        @athlete_stat       = AthleteStat.find params[:id]
        @team_participation = @athlete_stat.team_participation
        @stat_name          = params[:stat]
      end
  end
end