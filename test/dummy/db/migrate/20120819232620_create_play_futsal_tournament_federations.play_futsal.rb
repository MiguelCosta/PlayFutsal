# This migration comes from play_futsal (originally 20120819232140)
class CreatePlayFutsalTournamentFederations < ActiveRecord::Migration
  def change
    create_table :play_futsal_tournament_federations do |t|
      t.references :tournament
      t.references :federation

      t.timestamps
    end
    add_index :play_futsal_tournament_federations, :tournament_id
    add_index :play_futsal_tournament_federations, :federation_id
  end
end
