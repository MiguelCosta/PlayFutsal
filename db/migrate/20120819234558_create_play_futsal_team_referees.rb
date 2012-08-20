class CreatePlayFutsalTeamReferees < ActiveRecord::Migration
  def change
    create_table :play_futsal_team_referees do |t|

      t.timestamps
    end
  end
end
