class CreatePlayFutsalMatchEvents < ActiveRecord::Migration
  def change
    create_table :play_futsal_events do |t|
      t.integer :match_id,      :null => false
      t.integer :event_type_id, :null => false
      t.integer :player_id
      t.integer :other_player_id

      t.integer :minute
      t.string  :desc

      t.timestamps
    end
  end
end
