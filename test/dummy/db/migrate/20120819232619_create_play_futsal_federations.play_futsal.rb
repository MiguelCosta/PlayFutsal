# This migration comes from play_futsal (originally 20120819212139)
class CreatePlayFutsalFederations < ActiveRecord::Migration
  def change
    create_table :play_futsal_federations do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
