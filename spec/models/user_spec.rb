require 'rails_helper'
describe User, type: model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "mailが空だと登録できない" do
    end
    it "mailが一意性であること" do
    end
    it "mailは@を含む必要がある" do
    end
    it "passwordは6文字以上であること" do
    end
    it "passwordは半角英数字混合であること" do
    end
    it "passwordは確認用を含めて2回入力すること" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameは全角で入力すること" do
    end
    it "first_nameは全角で入力すること" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaは全角で入力すること" do
    end
    it  "first_name_kanaは全角で入力すること" do
    end
    it "birthdayが空だと登録できない" do
    end
  end
end
