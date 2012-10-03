require_dependency "play_futsal/application_controller"

module PlayFutsal
  class MatchesController < ApplicationController

    #### Filters ####

    before_filter :match_by_id, :only => [:show, :edit, :update, :begin, :finish]
    before_filter :load_all_teams, :only => [:new, :edit, :create]


    #### Actions ####

    def index
      @matches = Match.find :all, :order => 'datetime'
    end


    def show
      @events = Event.find_all_by_match_id params[:id], :order => 'minute'

      @event  = Event.new
    end


    def new
      @match = Match.new   
    end


    def edit
    end


    def create
      @match = Match.new params[:match]
raise
      if @match.save
        redirect_to match_path(@match), :notice => "Match successfully created"
      else
        render :new
      end
    end


    def update
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

    # start the game
    def begin
      @match.begin
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match started"
      else
        render :show
      end
    end

    # finish the game
    def finish
      @match.end
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match finished"
      else
        render :show
      end
    end

    protected

      def match_by_id
        @match = Match.find params[:id]
        # @match.home_team = Team.find(@match.home_team_id)
        # @match.away_team = Team.find(@match.away_team_id)
      end

      def load_all_teams
        @teams = Team.all
      end

  end
end
