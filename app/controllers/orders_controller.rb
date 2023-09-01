class OrdersController < ApplicationController
  def index
    @user_item = UserItem.new
    @product = Product.find(params[:item_id])
  end

  def create
    @product = Product.find(params[:item_id])
    @user_item = UserItem.new(purchase_params)

    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render :index
    end

    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def purchase_params
    params.require(:user_item).permit(
      :postal_code, :prefecture_id, :city, :street, :building, :phone_number,
      :name, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date,
      :image, :product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id,
      :prefecture_id, :day_to_ship_id, :price
    ).merge(user_id: current_user.id, product_id: params[:item_id])
  end

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end
  
end


