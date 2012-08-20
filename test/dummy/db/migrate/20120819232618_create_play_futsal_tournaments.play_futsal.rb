# This migration comes from play_futsal (originally 20120819210827)
class CreatePlayFutsalTournaments < ActiveRecord::Migration
  def change
    create_table :play_futsal_tournaments do |t|
      t.string :name

      t.timestamps
    end
  end
end
