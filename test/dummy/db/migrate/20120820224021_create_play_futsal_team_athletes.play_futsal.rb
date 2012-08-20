# This migration comes from play_futsal (originally 20120819234510)
class CreatePlayFutsalTeamAthletes < ActiveRecord::Migration
  def change
    create_table :play_futsal_team_athletes do |t|

      t.timestamps
    end
  end
end
