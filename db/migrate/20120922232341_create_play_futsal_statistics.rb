class CreatePlayFutsalStatistics < ActiveRecord::Migration
  def up
    create_table :play_futsal_athlete_stats do |t|
      t.integer :match_id
      t.integer :athlete_id
      
      t.integer :goals, :default => 0
      t.integer :fouls, :default => 0
    end

    create_table :play_futsal_participations do |t|
      t.integer :match_id
      t.integer :team_id

      t.integer :goals,        :default => 0
      t.integer :yellow_cards, :default => 0
      t.integer :red_cards,    :default => 0
    end


    create_table :play_futsal_group_stats do |t|
      t.integer :team_id,  :null => false
      t.integer :group_id, :null => false

      # stats
      t.integer :matches_played,     :default => 0
      t.integer :wins_home,          :default => 0
      t.integer :wins_away,          :default => 0
      t.integer :draws_home,         :default => 0
      t.integer :draws_away,         :default => 0
      t.integer :losses_home,        :default => 0
      t.integer :losses_away,        :default => 0
      t.integer :goals_for_home,     :default => 0
      t.integer :goals_for_away,     :default => 0
      t.integer :goals_against_home, :default => 0
      t.integer :goals_against_away, :default => 0
      t.integer :points,             :default => 0
      t.integer :position,           :default => 0

      # TODO add other stats here
    end
  end

  def down
    drop_table :play_futsal_athlete_stats
    drop_table :play_futsal_team_stats
    drop_table :play_futsal_group_stats
  end
end
