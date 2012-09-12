require_dependency "play_futsal/application_controller"

module PlayFutsal
  class MatchesController < ApplicationController

    def index
      @matches = Match.all :order => 'datetime'
    end


    def show
      @match  = Match.find params[:id]
      @events = Event.find_all_by_match_id params[:id]
      @event  = Event.new
      @athletes = @match.home_team.athletes + @match.away_team.athletes
    end


    def new
      @match = Match.new
      @teams = Team.all
    end


    def edit
      @match = Match.find params[:id]
      @teams = Team.all
    end


    def create
      @match = Match.new params[:match]

      if @match.save
        redirect_to match_path(@match), :notice => "Match successfully created"
      else
        render :new
      end
    end


    def update
      @match = Match.find params[:id]

      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match successfully updated"
      else
        render :edit
      end
    end


    def destroy
      Match.destroy params[:id]
      render :index
    end


    def add_event
      @match = Match.find params[:id]
      @event = @match.events.build params[:event]

      if @event.save
        redirect_to match_path(@match), :notice => 'Event successfully added'
      else
        render :show
      end
    end

  end
end
