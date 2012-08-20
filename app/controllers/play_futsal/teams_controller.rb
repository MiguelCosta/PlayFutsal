require_dependency "play_futsal/application_controller"

module PlayFutsal
  class TeamsController < ApplicationController

  	def index
  		@teams = Team.find :all
  	end
  
  	def show
		@team = Team.find(params[:id])  
  	end  
  
  	def new
  		@team = Team.new
  		@federations = Federation.find :all
  	end
  	
  	def edit
		@team = Team.find params[:id]
		@federations = Federation.find :all
  	end

  	def create
  		@team = Team.new params[:team]

  		if @team.save
  			redirect_to team_path(@team), :notice => 'Team create successfully created.'
  		else
  			@federations = Federation.find :all
  			render :new
  		end
  	end

  	def update
  		@team = Team.find params[:id]

  		if @team.update_attributes(params[:team])
  			redirect_to team_path(@team), :notice => 'Team successfully updated.'
  		else
  			@Federation.find :all
  			render :edit
  		end
  	end

	def destroy
	end


  end
end
