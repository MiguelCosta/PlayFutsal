class CreateGroupStats < ActiveRecord::Migration
  def up
    create_table :play_futsal_group_stats do |t|
      t.integer :team_id,  :null => false
      t.integer :group_id, :null => false

      t.integer :goals, :default => 0

      # TODO add other stats here
    end
  end

  def down
    drop_table :play_futsal_group_stats
  end
end
