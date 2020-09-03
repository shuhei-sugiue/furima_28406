require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  describe '配送先登録' do
    before do
      @address = FactoryBot.build(:purchaser_address)
      # @item.image = Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.png'), 'image/png')
    end
    it "zip_codeとprovince,municipal,street number,telephone,tokenが存在すれば登録できる" do
      expect(@address).to be_valid
    end
    it "tokenが空だと登録できない" do
      @address.token = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end
    it "zip_codeが空だと登録できない" do
      @address.zip_code = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
    end
    it "provinceが空だと登録できない" do
      @address.province = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Province can't be blank", "Province can't be blank")
    end
    it "municipalが空だと登録できない" do
      @address.municipal = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Municipal can't be blank")
    end
    it "street_numberが空だと登録できない" do
      @address.street_number = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Street number can't be blank")
    end
    it "telephoneが空だと登録できない" do
      @address.telephone = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid")
    end
    it "zip_codeにはハイフンが必要であること" do
      @address.zip_code = "1234567"
      @address.valid?
      expect(@address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it "telephoneにはハイフンが不要であること" do
      @address.telephone = "080-1234-5678"
      @address.valid?
      expect(@address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)", "Telephone is invalid")
    end
    it "telephoneは11桁以内であること" do
      @address.telephone = "080123456789"
      @address.valid?
      expect(@address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
    end
  end
end