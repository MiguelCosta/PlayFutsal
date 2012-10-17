class CreatePlayFutsalPhases < ActiveRecord::Migration
  def change
    create_table :play_futsal_phases do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
