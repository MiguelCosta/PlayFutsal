class CreateFederations < ActiveRecord::Migration
  def change
    create_table :federations do |t|
      t.string :name
      t.references :country

      t.timestamps
    end
    add_index :federations, :country_id
  end
end
