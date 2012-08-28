class CreatePlayFutsalTeams < ActiveRecord::Migration
  def up
    create_table :play_futsal_teams do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :play_futsal_teams
  end

end
