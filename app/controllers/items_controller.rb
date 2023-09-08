class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :item_purchase, only: :edit

  def index
    @products = Product.order(created_at: :desc)
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

  def show
  end

  def edit
    if current_user != @product.user
      redirect_to root_path, alert: '出品者以外は編集できません。'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to item_path(@product), notice: '商品情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if current_user == @product.user
      @product.destroy
      redirect_to root_path, notice: '商品が削除されました。'
    else
      redirect_to root_path, alert: '出品者以外は削除できません。'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id,
                                    :prefecture_id, :day_to_ship_id, :price, :image)
  end

  def item_purchase
    if @product.purchase.present?
      redirect_to root_path
    end
  end
end
