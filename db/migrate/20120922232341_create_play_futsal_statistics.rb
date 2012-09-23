class CreatePlayFutsalStatistics < ActiveRecord::Migration
  def up
    create_table :play_futsal_stats do |t|
      t.integer :match_id
      t.integer :athlete_id
      
      t.integer :goals, :default => 0
      t.integer :fouls, :default => 0
    end
  end

  def down
    drop_table :play_futsal_stats
  end
end
