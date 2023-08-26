require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product, user: @user)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'expect(@product).to be_valid' do
      end
    end

    context '出品できない場合' do
      it '商品画像が必須であること' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品名が41字以上であれば保存できないこと' do
        @product.product_name = 'a' * 41
        @product.valid?
        expect(@product.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
      end

      it '商品の説明が必須であること' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it '商品の説明が1001文字以上であれば保存できないこと' do
        @product.description = 'a' * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが選択されていないと保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーの初期値「---」では保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が必須であること' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態が選択されていないと保存できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態の初期値「---」では保存できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が必須であること' do
        @product.shipping_fee_burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it '配送料の負担が選択されていないと保存できない' do
        @product.shipping_fee_burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it '配送料の負担が初期値「---」では保存できない' do
        @product.shipping_fee_burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it '発送元の地域の情報が必須であること' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域が選択されていないと保存できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '配送料の負担が初期値「---」では保存できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報が必須であること' do
        @product.day_to_ship_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship can't be blank")
      end

      it '発送までの日数が選択されていないと保存できない' do
        @product.day_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship can't be blank")
      end

      it '発送までの日数が初期値「---」では保存できない' do
        @product.day_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship can't be blank")
      end

      it '価格は¥300以上であること' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格は¥9,999,999以下であること' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格は半角数値のみ保存可能であること' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '価格が空では出品できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'userが紐付いていなければ出品できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end
