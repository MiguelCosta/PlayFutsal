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
      @groups = Group.all
      @group = params[:group_id]
      @phases = Phase.all
      @phase = params[:phase_id]
    end


    def edit
      @match = Match.find params[:id]
      @groups = Group.all
      @phases = Phase.all
    end


    def create
      @match = Match.new params[:match]
      @match.add_participations(params[:home_team][:id], params[:away_team][:id])

      if @match.save
        redirect_to match_path(@match), :notice => "Match successfully created"
      else
        @groups = Group.all
        @phases = Phase.all
        render :new
      end
    end


    def update
      @match = Match.find params[:id]
      @home_team_id = params[:home_team][:id]
      @away_team_id = params[:away_team][:id]
      if (@match.update_attributes(params[:match])  &&
          @match.participations.first.update_attribute(:team_id, @home_team_id) &&
          @match.participations.last.update_attribute(:team_id, @away_team_id))

        redirect_to match_path(@match), :notice => "Match successfully updated"
      else
        render :edit
      end
    end


    def destroy
      Match.destroy params[:id]
      render :index
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
