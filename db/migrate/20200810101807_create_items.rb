class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name,              null: false
      t.text :discription, null: false
      t.integer :price,          null: false
      t.integer :category_id,  null: false
      t.integer :state_id,       null: false
      t.integer :charge_id,      null: false
      t.integer :shipper_id,     null: false
      t.integer :ship_date_id,   null: false
      t.timestamps
    end
  end
end
