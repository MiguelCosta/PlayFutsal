require_dependency "play_futsal/application_controller"

module PlayFutsal
  class TeamsController < ApplicationController

    def index
      @teams = Team.all
    end


    def show
      @team     = Team.find(params[:id])
      @athletes = Athlete.find_by_team_id(@team)
    end


    def new
      @team = Team.new
    end


    def edit
      @team = Team.find params[:id]
    end


    def create
      @team = Team.new params[:team]
      
      if @team.save
        redirect_to team_path(@team), :notice => "Team #{@team.name} successfully created."
      else
        render :new
      end
    end


    def update
      @team = Team.find params[:id]
      
      if @team.update_attributes(params[:team])
        redirect_to team_path(@team), :notice => 'Team successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      
    end

  end
end
