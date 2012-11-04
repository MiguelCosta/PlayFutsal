module PlayFutsal
  module MatchesHelper

    def athlete_increment_stat_link(stats, stat_name)
      link_to '', increment_athlete_stat_path(stats, stat_name),
                  :method => :put,
                  :class => 'icon-arrow-up'
    end

    def athlete_decrement_stat_link(stats, stat_name)
      if stats.send(stat_name) > 0
        link_to '', decrement_athlete_stat_path(stats, stat_name),
                    :method => :put,
                    :class => 'icon-arrow-down'
      end
    end


    def show_athlete_stat(stats, stat_name)
      stat = [stats.send(stat_name)]
      if admin? and stats.match.in_progress?
        stat.push(athlete_increment_stat_link(stats, stat_name), athlete_decrement_stat_link(stats, stat_name))
      end
      raw stat.join
    end


    def team_increment_stat_link(stats, stat_name)
        link_to '', increment_participation_path(stats, stat_name),
                    :method => :put,
                    :class => 'icon-arrow-up'
    end

    def team_decrement_stat_link(stats, stat_name)
      if stats.send(stat_name) > 0
        link_to '', decrement_participation_path(stats, stat_name),
                    :method => :put,
                    :class => 'icon-arrow-down'
      end
    end


    def show_team_stat(stats, stat_name)
      stat = [stats.send(stat_name)]
      if admin? and stats.match.in_progress?
        stat.push(team_increment_stat_link(stats, stat_name), team_decrement_stat_link(stats, stat_name))
      end
      raw stat.join
    end

  end
end
