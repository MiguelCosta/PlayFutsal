module PlayFutsal
  module ApplicationHelper
    def options_for_athletes (object)
      # Displays User's name and selects the team's athlete's user_id (the reference to User)
      options_for_select(@athletes.collect { |a| [a.name, a.id] }, object.athletes.map(&:id))
    end
  end
end
