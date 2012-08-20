# This migration comes from play_futsal (originally 20120819234558)
class CreatePlayFutsalTeamReferees < ActiveRecord::Migration
  def change
    create_table :play_futsal_team_referees do |t|

      t.timestamps
    end
  end
end
