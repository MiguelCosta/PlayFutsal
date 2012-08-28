module PlayFutsal
  class AthletesController < ApplicationController

    def index
      @athletes = Athlete.all
    end

  end
end