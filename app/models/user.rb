class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  zenkakukana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'is invalid' }
    validates :nickname
    validates :last_name, format: { with: zenkaku, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: zenkaku, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: zenkakukana, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: zenkakukana, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end

    has_one :purchaser
    has_many :items
end
