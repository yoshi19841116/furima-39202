class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:index, :create]

  def index
    @user_item = UserItem.new
      if @product.user == current_user
        redirect_to root_path
      end

      if @product.purchase.present?
        redirect_to root_path
      end
  end

  def create
    @user_item = UserItem.new(purchase_params)
    if @user_item.valid?
      pay_item
      @user_item.save_with_purchase(current_user.id, params[:item_id])
      redirect_to root_path and return
    else
      flash[:alert] = '申し訳ありません、商品は売り切れました。'
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_item).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_number).merge(
      product_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:item_id])
  end
end
