class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :delivery_region_id, null: false
      t.string :city, null: false
      t.string :address_first, null: false
      t.string :address_second
      t.string :phone, null: false
      t.timestamps
    end
  end
end
