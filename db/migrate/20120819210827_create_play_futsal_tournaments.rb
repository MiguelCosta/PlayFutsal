class CreatePlayFutsalTournaments < ActiveRecord::Migration
  def change
    create_table :play_futsal_tournaments do |t|
      t.string :name

      t.timestamps
    end
  end
end
