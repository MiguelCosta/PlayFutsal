module PlayFutsal
  module ApplicationHelper

    def sidebar_link(text, path)
      link_to path do
        raw('<i class="icon-chevron-right"></i>') + text
      end
    end

    def options_for_athletes (object)
      # Displays User's name and selects the team's athlete's user_id (the reference to User)
      options_for_select(@athletes.collect { |a| [a.name, a.id] }, object.athletes.map(&:id))
    end

    def options_for_teams (object)
      # Displays Team's name and selects the team's user_id
      options_for_select(@teams.collect { |t| [t.name, t.id] }, object.teams.map(&:id))
    end
  end
end
