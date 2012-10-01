require_dependency "play_futsal/application_controller"

module PlayFutsal
  class StatisticsController < ApplicationController


    def create
      @match = Match.find params[:match_id]
      @athlete = Athlete.find params[:athlete_id]
      @statistc = @match.statistcs.build params[:statistic]

      if @statistc.save
        redirect_to match_path(@statistc.match), :notice => 'Statistc successfully added'
      else
        redirect_to :back
      end
    end

    def destroy
      Statistc.destroy params[:id]
      redirect_to :back
    end

  end
end