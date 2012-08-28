# This migration comes from play_auth (originally 20120827100337)
class AddUserData < ActiveRecord::Migration
  def up
    change_table :play_auth_users do |t|
      t.string  :first_name, :default => nil
      t.string  :last_name,  :default => nil
      t.integer :role_id
    end
  end

  def down
    change_table :play_auth_users do |t|
      t.remove :first_name
      t.remove :last_name
      t.remove :role_id
    end
  end
end
