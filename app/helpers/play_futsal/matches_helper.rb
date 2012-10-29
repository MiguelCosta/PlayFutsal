module PlayFutsal
  module MatchesHelper

    def increment_stat_link(stats, stat_name)
      link_to '', increment_athlete_stat_path(stats, stat_name),
                  :method => :put,
                  :class => 'icon-arrow-up'
    end

    def decrement_stat_link(stats, stat_name)
      if stats.send(stat_name) > 0
        link_to '', decrement_athlete_stat_path(stats, stat_name),
                    :method => :put,
                    :class => 'icon-arrow-down'
      end
    end


    def show_athlete_stat(stats, stat_name)
      stat = [stats.send(stat_name)]
      if admin?
        stat.push(increment_stat_link(stats, stat_name), decrement_stat_link(stats, stat_name))
      end
      raw stat.join
    end
  end
end
