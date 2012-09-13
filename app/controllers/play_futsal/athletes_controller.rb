require_dependency "play_futsal/application_controller"

module PlayFutsal
  class AthletesController < ApplicationController

    def index
      @athletes = Athlete.all
    end


    def show
      @athlete = Athlete.find params[:id]
    end


    def new
      @athlete = Athlete.new
    end


    def edit
      @athlete = Athlete.find params[:id]
    end


    def create
      @athlete = Athlete.new params[:athlete]
      if @athlete.save
        redirect_to athlete_path(@athlete), :notice => "Athlete #{@athlete.name} successfully created."
      else
        render :new
      end
    end


    def update
      @athlete = Athlete.find params[:id]

      if @athlete.update_attributes params[:athlete]
        redirect_to athlete_path(@athlete), :notice => "Athlete #{@athlete.name} successfully updated"
      else
        render :edit
      end
    end


    def destroy
      
    end

    def remove_from_team
      @athlete = Athlete.find params[:id]
      @athlete.team = nil
      @athlete.save
      redirect_to :back
    end

  end
end