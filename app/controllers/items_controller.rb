class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  ##showは詳細ページで実装かな？

  def index
  end

  def new
    if user_signed_in?
      # ログインしている場合の処理
      @product = Product.new
    else
      # ログアウト状態の場合の処理
      redirect_to new_user_session_path, alert: '商品を出品するにはログインが必要です'
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :day_to_ship_id, :price, :image)
  end
end