class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :own_item_or_sold_out, only: [:edit, :update, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def index

    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = @item.user
    @items = Item.all.order('created_at DESC')
    @sold_out = @item.order.present?
  end

  def edit
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def find_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_describe, :category_id, :condition_id, :delivery_charge_id,
                                 :delivery_region_id, :delivery_day_id, :price, :image)
  end

  def own_item_or_sold_out
    @item = Item.find(params[:id])
    if !(user_signed_in? && @item.user_id == current_user.id) || @item.order.present?
        redirect_to root_path
    end
  end
end
