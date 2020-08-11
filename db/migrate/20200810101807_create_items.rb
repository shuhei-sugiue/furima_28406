class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :discription
      t.integer :price
      t.integer :categories_id
      t.integer :state_id
      t.integer :charge_id
      t.integer :shipper_id
      t.integer :ship_date_id
      t.timestamps
    end
  end
end
