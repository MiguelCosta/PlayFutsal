module PlayFutsal
  module GroupsHelper

    def show_team_position(team, all_teams)
      pos = [team.group_stat.position]
      if admin?
        all_stats = all_teams.map(&:group_stat)
        with_same_points = all_stats.select { |stat| stat.points == team.group_stat.points }
        if with_same_points.find { |stat| stat.position == team.group_stat.position - 1 }
          pos.push(link_to('', increment_group_stat_path(team.group_stat), class: 'icon-arrow-up', method: :put))
        end

        if with_same_points.find { |stat| stat.position == team.group_stat.position + 1 }
          pos.push(link_to('', decrement_group_stat_path(team.group_stat), class: 'icon-arrow-down', method: :put))
        end
      end

      raw pos.join
    end


  end
end
