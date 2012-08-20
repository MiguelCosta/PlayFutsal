require_dependency "play_futsal/application_controller"

module PlayFutsal
  class TeamController < ApplicationController

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


  
  end
end
