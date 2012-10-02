class CreatePlayFutsalGroupStats < ActiveRecord::Migration
  def change
    create_table :play_futsal_group_stats do |t|

      t.timestamps
    end
  end
end
