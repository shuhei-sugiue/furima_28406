class PurchaserAddress

    include ActiveModel::Model
    attr_accessor :zip_code, :province, :municipal, :street_number, :building, :telephone, :token, :item_id, :user_id

    eisuji = /\A[0-9]+\z/
    eisujihaihun = /\A[0-9]{3}-[0-9]{4}\z/

    with_options presence: true do
      validates :zip_code, format: {with: eisujihaihun, message: "is invalid. Include hyphen(-)"}
      validates :telephone, length: { maximum: 11 }, format: {with: eisuji}
      validates :municipal
      validates :street_number
      validates :province, numericality: { other_than: 0, message: "can't be blank" }
      validates :token
    end

    def save
      purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
      Address.create(zip_code: zip_code, province: province, municipal: municipal, street_number: street_number, building: building, telephone: telephone, purchaser_id: purchaser.id)
    end
end