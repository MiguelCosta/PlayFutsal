require_dependency "play_futsal/application_controller"

module PlayFutsal
  class ParticipationsController < ApplicationController

    before_filter :get_data, only: [:increment, :decrement]

    def increment
      @participation.increment @stat_name
      redirect_to :back
    end

    def decrement
      @participation.decrement @stat_name
      redirect_to :back
    end

    protected

      def get_data
        @participation = Participation.find params[:id]
        @stat_name     = params[:stat]
      end
  end
end
