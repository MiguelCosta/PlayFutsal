# This migration comes from play_futsal (originally 20120819234702)
class CreatePlayFutsalTeamStaffs < ActiveRecord::Migration
  def change
    create_table :play_futsal_team_staffs do |t|

      t.timestamps
    end
  end
end
