require_dependency "play_futsal/application_controller"

module PlayFutsal
  class GroupsController < ApplicationController

    #### Filters ####

    before_filter :group_by_id, :only => [:show, :edit, :update]


    #### Actions ####

    def index
      @groups = Group.find :all
    end

    def show
    end


    def new
      @group = Group.new
      @teams = Team.not_in_group
    end


    def edit
      update_group_teams

      if @group
        @teams_selected = @group.teams
      end

      # only select teams without group
      @teams = Team.not_in_group
    end


    def create
      @group     = Group.new params[:group]
      update_group_teams

      if params[:team_ids]
          @group.teams = Team.find params[:team_ids]
      else
          @group.teams = []
       end

      if @group.save
        redirect_to group_path(@group), :notice => "Group #{@group.name} successfully created."
      else
        render :new
      end
    end


    def update
      if params[:team_ids]
          @group.teams = Team.find params[:team_ids]
      else
          @group.teams = []
       end

      if @group.update_attributes params[:group]
        redirect_to group_path(@group), :notice => 'Group successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      
    end

    protected

      #### Filters

      def group_by_id
        @group = Group.find params[:id]
      end

      def update_group_teams
        if params[:team_ids]
          params[:team_ids].each do |id|
            team = Team.find id
            unless team.nil?
              @group.teams << team
            end
          end
        end
      end
  end
end
