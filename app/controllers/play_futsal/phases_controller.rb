require_dependency "play_futsal/application_controller"

module PlayFutsal
  class PhasesController < ApplicationController

    #### Actions ####

    def index
      @phases = Phase.all
    end

    def show
      @phase = Phase.find params[:id]
    end


    def new
      @phase = Phase.new
    end


    def edit
      @phase = Phase.find params[:id]
    end


    def create
      @phase = Phase.new params[:phase]

      if @phase.save
        redirect_to phase_path(@phase), :notice => "Phase #{@phase.name} successfully created."
      else
        render :new
      end
    end


    def update
      @phase = Phase.find params[:id]

      if @phase.update_attributes params[:phase]
        redirect_to phase_path(@phase), :notice => 'Phase successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @phase.find params[:id]
      @phase.destroy

      redirect_to phases_path, :notice => 'Phase deleted'
    end
  end
end
