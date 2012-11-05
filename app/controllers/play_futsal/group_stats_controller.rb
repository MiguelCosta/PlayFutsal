require_dependency "play_futsal/application_controller"

module PlayFutsal
  class GroupStatsController < ApplicationController

    before_filter :get_data, only: [:increment, :decrement]

    def increment
      @group_stat.move_down
      redirect_to :back
    end

    def decrement
      @group_stat.move_up
      redirect_to :back
    end

    protected

      def get_data
        @group_stat = GroupStat.find params[:id]
      end
  end
end
