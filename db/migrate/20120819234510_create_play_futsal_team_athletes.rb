class CreatePlayFutsalTeamAthletes < ActiveRecord::Migration
  def change
    create_table :play_futsal_team_athletes do |t|

      t.timestamps
    end
  end
end
