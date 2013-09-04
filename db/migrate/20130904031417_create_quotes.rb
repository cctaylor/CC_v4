class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name_first
      t.string :name_last
      t.string :email
      t.string :phone
      t.string :item
      t.string :color1
      t.string :color2
      t.string :paper
      t.string :fold
      t.integer :quantity
      t.text :message

      t.timestamps
    end
  end
end
