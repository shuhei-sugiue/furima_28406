require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.png'), 'image/png')
    end
    it '画像は一枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.discription = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Discription can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end
    it '商品の状態についての情報が必須であること' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank", 'State is not a number')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank", 'Charge is not a number')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.shipper_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipper can't be blank", 'Shipper is not a number')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.ship_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date can't be blank", 'Ship date is not a number')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is not a number')
    end
    it '価格の範囲が300~9999999の間であること' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
  end
end
