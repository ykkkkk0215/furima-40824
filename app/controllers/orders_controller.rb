class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_params, only: [:index, :create]
  before_action :own_item_or_sold_out, only: [:index]

  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      if @order_address.save
        return redirect_to root_path
      else
        gon.public_key = ENV['PAYJP_PUBLIC_KEY']
        render 'index', status: :unprocessable_entity
      end
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :delivery_region_id, :city, :address_first, :address_second, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def own_item_or_sold_out
    if !user_signed_in? || @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end
end
