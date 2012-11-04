module PlayFutsal
  module ApplicationHelper

    def navbar_item(text, path)
      class_name = current_page?(path) ? 'active' : ''
      content_tag :li, :class => class_name do
        link_to text, path, :class => class_name
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


    def admin?
      current_user && current_user.admin?
    end
  end
end
