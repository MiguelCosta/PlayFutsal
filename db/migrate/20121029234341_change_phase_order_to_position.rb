class ChangePhaseOrderToPosition < ActiveRecord::Migration
  def up
    rename_column :play_futsal_phases, :order, :position
  end

  def down
    rename_column :play_futsal_phases, :position, :order
  end
end
