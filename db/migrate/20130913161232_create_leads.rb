class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name_first
      t.string :name_last
      t.string :email
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
