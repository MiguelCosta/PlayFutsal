class CreatePlayFutsalTeams < ActiveRecord::Migration
  def up
    create_table :play_futsal_teams do |t|
      t.string :name, :null => false

      t.integer :goals,        :default => 0
      t.integer :yellow_cards, :default => 0
      t.integer :red_cards,    :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_teams
  end

end
