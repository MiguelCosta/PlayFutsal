require_dependency "play_futsal/application_controller"

module PlayFutsal
  class GroupsController < ApplicationController

    def index
      @groups = Group.all
    end

    def show
      @group = Group.find params[:id]
      @teams = @group.teams
    end


    def new
      @group = Group.new
      @teams = Team.find :all
    end


    def edit
      @group = Group.find params[:id]
      update_group_groups

      if @group
        @teams_selected = @group.teams
      end

      # only select teams without group
      @teams = Team.find_all_by_group_id nil
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
        redirect_to group_path(@group), :notice => "Group #{@team.name} successfully created."
      else
        render :new
      end
    end


    def update
      @group = Group.find params[:id]
      
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

      def update_group_athletes
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
