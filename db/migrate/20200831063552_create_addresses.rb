class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,       default: "",     null: false
      t.string :privince,                        null: false
      t.string :municipal,      default: "",     null: false
      t.string :street_number,  default: "",     null: false
      t.string :building,       default: ""
      t.string :telephone,      default: "",     null: false
      t.references :purchaser,                   null: false
      t.timestamps
    end
  end
end
