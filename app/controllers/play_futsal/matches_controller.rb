require_dependency "play_futsal/application_controller"

module PlayFutsal
  class MatchesController < ApplicationController

    #### Filters ####

    before_filter :match_by_id, :only => [:show, :edit, :update, :begin, :finish, :athlete_add_goal, :athlete_remove_goal, :athlete_add_foul, :athlete_remove_foul]
    before_filter :load_all_teams, :only => [:new, :edit, :create]
    before_filter :load_athlete_stat, :only =>[:athlete_add_goal, :athlete_remove_goal, :athlete_add_foul, :athlete_remove_foul]


    #### Actions ####

    def index
      @matches = Match.find :all, :order => 'datetime'
    end


    def show
      @events = Event.find_all_by_match_id params[:id], :order => 'minute'
      @event  = Event.new
    end


    def new
      @match = Match.new
      @phases = Phase.all
      @phase = params[:phase_id]
    end


    def edit
      @match = Match.find params[:id]
      @phases = Phase.all
    end


    def create
      @match = Match.new params[:match]
      @match.add_participations(params[:home_team][:id], params[:away_team][:id])

      if @match.save
        redirect_to match_path(@match), :notice => "Match successfully created"
      else
        @phases = Phase.all
        render :new
      end
    end


    def update

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
      @match.begin
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match started"
      else
        render :show
      end
    end

    # finish the game
    def finish
      @match.end
      if @match.update_attributes params[:match]
        redirect_to match_path(@match), :notice => "Match finished"
      else
        render :show
      end
    end


    ################ 
    #        Athlete Stats        #
    ################
    # athlete add goal
    def athlete_add_goal
      if @athlete_stat.update_attribute(:goals, @athlete_stat.goals+1)
        redirect_to match_path(@match), :notice => "Goal added"
      else
        render :show
      end
    end
    def athlete_remove_goal
      if @athlete_stat.goals > 0 && @athlete_stat.update_attribute(:goals, @athlete_stat.goals-1)
        redirect_to match_path(@match), :notice => "Goal removed"
      else
        render :show
      end
    end

    def athlete_add_foul
      if @athlete_stat.update_attribute(:fouls, @athlete_stat.fouls+1)
        redirect_to match_path(@match), :notice => "Foul added"
      else
        render :show
      end
    end

    def athlete_remove_foul
      if @athlete_stat.fouls > 0 && @athlete_stat.update_attribute(:fouls, @athlete_stat.fouls-1)
        redirect_to match_path(@match), :notice => "Foul removed"
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
        logger.info '########################################DEBUG:' + @athlete_stat.inspect
      end

  end
end
