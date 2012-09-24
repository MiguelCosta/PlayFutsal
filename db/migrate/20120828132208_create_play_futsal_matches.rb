class CreatePlayFutsalMatches < ActiveRecord::Migration
  def up
    create_table :play_futsal_matches do |t|
      t.integer :home_team_id
      t.integer :away_team_id

      t.integer :home_team_stats
      t.integer :away_team_stats

      #t.integer :home_score, :null => false, :default => 0
      #t.integer :away_score, :null => false, :default => 0

      t.string   :desc
      t.datetime :datetime
      
      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_matches
  end

end
