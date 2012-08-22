require_dependency "play_futsal/application_controller"

module PlayFutsal
  class TeamsController < ApplicationController
    before_filter :before_new, :only => [:new, :create, :edit, :update]

  	def index
  		@teams = Team.find :all
  	end
  
  	def show
		@team = Team.find(params[:id])  
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
  			redirect_to team_path(@team), :notice => 'Team create successfully created.'
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

  protected
  def before_new
    @federations = PlayFutsal.federation_class.classify.constantize.find :all
    #@federations = Federation.all
    #@athletes = User.find :all
  end

  end
end
