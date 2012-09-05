require_dependency "play_futsal/application_controller"

module PlayFutsal
  class MatchesController < ApplicationController

    def index
      @matches = Match.all
    end


    def show
      @match = Match.find params[:id]
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
      
    end

  end
end
