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
      @team     = Team.new
      @athletes = Athlete.find :all
    end


    def edit
      @team = Team.find params[:id]

      if @team
        @athletes_selected = @team.athletes
      end

      # only select athletes without team
      @athletes = Athlete.where("team_id=null")

    end


    def create
      @team     = Team.new params[:team]  

      if params[:athlete_ids]
          @team.athletes = Athelete.find(params[:athlete_ids]) 
      else
          @team.athletes = []
       end

      if @team.save
        redirect_to team_path(@team), :notice => "Team #{@team.name} successfully created."
      else
        render :new
      end
    end


    def update
      @team = Team.find params[:id]
      
      if params[:athlete_ids]
          @team.athletes = Athlete.find(params[:athlete_ids]) 
      else
          @team.athletes = []
       end

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
