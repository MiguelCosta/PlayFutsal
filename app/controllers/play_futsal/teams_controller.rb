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
      update_team_athletes

      if @team
        @athletes_selected = @team.athletes
      end

      # only select athletes without team
      @athletes = Athlete.find_all_by_team_id nil
    end


    def create
      @team     = Team.new params[:team]
      update_team_athletes

      if params[:athlete_ids]
          @team.athletes = Athlete.find(params[:athlete_ids]) 
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

    protected

      def update_team_athletes
        if params[:athlete_ids]
          params[:athlete_ids].each do |id|
            athlete = Athlete.find id
            unless athlete.nil?
              @team.athletes << athlete
            end
          end
        end
      end
  end
end
