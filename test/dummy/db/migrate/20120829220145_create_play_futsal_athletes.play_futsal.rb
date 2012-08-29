# This migration comes from play_futsal (originally 20120828130900)
class CreatePlayFutsalAthletes < ActiveRecord::Migration
  def up
    create_table :play_futsal_athletes do |t|
      t.integer :user_id, :null => false
      t.integer :team_id, :null => false
      t.integer :number,  :null => false
      
      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_athletes
  end

end
