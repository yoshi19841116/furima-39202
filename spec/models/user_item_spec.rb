require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end

  context '正常な場合' do
    it 'クレジットカード情報、配送先情報があれば保存できること' do
      expect(@user_item).to be_valid
    end
  end

  context '異常な場合' do
    it 'トークンが空では保存できないこと' do
      @user_item.token = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必須であること' do
      @user_item.postal_code = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が正しい形式でないと保存できないこと' do
      @user_item.postal_code = '1234567'
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it '都道府県が必須であること' do
      @user_item.prefecture_id = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県が選択されていないと保存できない' do
      @user_item.prefecture_id = 1
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が必須であること' do
      @user_item.city = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @user_item.street = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Street Addresses can't be blank")
    end

    it '電話番号が必須であること' do
      @user_item.phone_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が正しい形式でないと保存できないこと' do
      @user_item.phone_number = '090-1234-5678' 
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number is too short", "Phone number Input only number")
    end
    
    it '電話番号が11桁未満では保存できないこと' do
      @user_item.phone_number = '0123456789' 
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include()
    end
  end
end
