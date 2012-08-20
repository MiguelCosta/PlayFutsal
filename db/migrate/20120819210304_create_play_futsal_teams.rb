class CreatePlayFutsalTeams < ActiveRecord::Migration
  def change
    create_table :play_futsal_teams do |t|
      t.string :name

      t.timestamps
    end
  end
end
