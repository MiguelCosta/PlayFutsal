class CreatePlayFutsalMatches < ActiveRecord::Migration
  def up
    create_table :play_futsal_matches do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :group_id

      t.integer :home_team_stats
      t.integer :away_team_stats

      t.string   :desc
      t.datetime :datetime

      t.boolean :started,  :default => false
      t.boolean :finished, :default => false
      
      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_matches
  end

end
