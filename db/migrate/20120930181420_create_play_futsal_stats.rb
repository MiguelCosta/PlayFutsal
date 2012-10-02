class CreatePlayFutsalStats < ActiveRecord::Migration
  def change
    create_table :play_futsal_stats do |t|

      t.timestamps
    end
  end
end
