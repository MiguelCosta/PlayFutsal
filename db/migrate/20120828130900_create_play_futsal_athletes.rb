class CreatePlayFutsalAthletes < ActiveRecord::Migration
  def up
    create_table :play_futsal_athletes do |t|
      t.integer :user_id, :null => false
      t.integer :team_id
      t.integer :number

      t.integer :goals,        :default => 0
      t.integer :yellow_cards, :default => 0
      t.integer :red_cards,    :default => 0
      
      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_athletes
  end

end
