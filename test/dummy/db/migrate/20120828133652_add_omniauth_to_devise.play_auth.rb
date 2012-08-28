# This migration comes from play_auth (originally 20120808035542)
class AddOmniauthToDevise < ActiveRecord::Migration
  def up
		#add_index  :play_auth_users, :confirmation_token,   :unique => true

		create_table :play_auth_authorizations do |t|
			t.string  :provider, :null => false
			t.string  :uid,      :null => false
			t.integer :user_id
			t.string  :email
			t.string  :token
			t.string  :secret
			t.string  :name
			t.string  :link
			t.string  :image_url

			t.timestamps
		end
	end
  
	def down
		remove_index :play_auth_users, :confirmation_token

		drop_table :play_auth_authorizations
	end
end
