require_dependency "play_futsal/application_controller"

module PlayFutsal
  class EventsController < ApplicationController


    def create
      @match = Match.find params[:match_id]
      @event = @match.events.build params[:event]

      if @event.save
        redirect_to match_path(@event.match), :notice => 'Event successfully added'
      else
        redirect_to :back
      end
    end

    def destroy
      Event.destroy params[:id]
      redirect_to :back
    end

  end
end