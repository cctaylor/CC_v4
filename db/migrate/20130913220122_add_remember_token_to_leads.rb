class AddRememberTokenToLeads < ActiveRecord::Migration
  def change
  	add_column :leads, :remember_token, :string
  	add_index :leads, :remember_token
  end
end
