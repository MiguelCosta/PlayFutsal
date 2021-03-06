require_dependency "play_futsal/application_controller"

module PlayFutsal
  class MatchesController < ApplicationController

    #### Filters ####

    before_filter :match_by_id, :only => [:athlete_add_goal, :athlete_remove_goal, :athlete_add_foul, :athlete_remove_foul,
                                                            :participation_add_goal, :participation_remove_goal, :participation_add_foul, :participation_remove_foul]
    before_filter :load_all_teams, :only => [:new, :edit, :create]
    before_filter :load_athlete_stat, :only =>[:athlete_add_goal, :athlete_remove_goal, :athlete_add_foul, :athlete_remove_foul]
    before_filter :load_participation, :only =>[:participation_add_goal, :participation_remove_goal, :participation_add_foul, :participation_remove_foul]


    #### Actions ####

    def index
      @matches = Match.find :all, :order => 'datetime'
    end

    def live
      @matches = Match.find_all_by_started_and_finished(true, false)
    end

    def show
      @match = Match.find params[:id]
      @events = Event.find_all_by_match_id params[:id], :order => 'minute DESC'
      @event  = Event.new
    end


    def new
      @match = Match.new
      @match.group = Group.find params[:group_id] if params[:group_id]
      @match.phase = Phase.find params[:phase_id] if params[:phase_id]
      @groups = Group.find :all
      @phases = Phase.find :all

      if @match.group
        @teams = Team.by_group(@match.group)
      end
    end


    def edit
      @match = Match.find params[:id]
      @groups = Group.find :all
      @phases = Phase.find :all
    end


    def create
      @match = Match.new params[:match]

      if @match.save
        @match.set_teams(params[:home_team][:id], params[:away_team][:id]) if params[:home_team] && params[:away_team]
        redirect_to match_path(@match), :notice => "Match successfully created"
      else
        @groups = Group.all
        @phases = Phase.all
        render :new
      end
    end


    def update
      @match = Match.find params[:id]
      debugger
      if (@match.update_attributes(params[:match]))#  &&
          #@match.participations.first.update_attribute(:team_id, params[:home_team][:id]) &&
          #@match.participations.last.update_attribute(:team_id, params[:away_team][:id]))

        redirect_to match_path(@match), :notice => "Match successfully updated"
      else
        render :edit
      end
    end


    def destroy
      Match.destroy params[:id]
      redirect_to :back
    end

    # start the game
    def begin
      @match = Match.find params[:id]
      @match.begin
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match started"
      else
        render :show
      end
    end

    # finish the game
    def finish
      @match = Match.find params[:id]
      @match.finish
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match finished"
      else
        render :show
      end
    end


    protected

      def match_by_id
        @match = Match.find params[:id]
      end

      def load_all_teams
        @teams = Team.all
      end

      def load_athlete_stat
        @athlete_stat = AthleteStat.find_by_match_id_and_athlete_id(@match.id, params[:athlete])
      end

      def load_participation
        @participation = Participation.find_by_id(params[:participation])
      end

  end
end
