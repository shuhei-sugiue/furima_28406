class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :charge
  belongs_to_active_hash :shipper
  belongs_to_active_hash :ship_date

  validates :name, :discription, :category, :state, :charge, :shipper, :ship_date, :price, :image, presence: true

  validates :category_id, :state_id, :charge_id, :shipper_id, :ship_date_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchaser
  has_one_attached :image
  has_many :comments
end
