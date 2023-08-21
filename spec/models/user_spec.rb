require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user.name = ''  # nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'カナ名が空では登録できない' do
      @user.first_name_kana ''
      @user.last_name_kana ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it '生年月日が空では登録できない' do
      @user.birth_date ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it 'メールアドレスが必須であること' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'メールアドレスが一意性であること' do
      existing_user = FactoryBot.create(:user, email: 'test@example.com')
      user = FactoryBot.build(:user, email: existing_user.email)
      user.valid?
      expect(user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスは、@を含む必要があること' do
      user = FactoryBot.build(:user, email: 'invalid_email')
      user.valid?
      expect(user.errors.full_messages).to include "Email is invalid"
    end

    it 'パスワードが必須であること' do
      user = FactoryBot.build(:user, password: '')
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      user = FactoryBot.build(:user, password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      user = FactoryBot.build(:user, password_confirmation: 'mismatched_password')
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end