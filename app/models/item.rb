class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, :description, :category, :state, :charge, :shipper, :ship_date, :price, presence: true

  validates :categories_id, :state_id, :charge_id, :shipper_id, :ship_date_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchaser

end
