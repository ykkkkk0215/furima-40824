class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def show
    Item.find(params[:id])
    @user = @item.user
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
      render :new #, status: :unprocessable_entity
    end
  end
  
  # def edit
  # end

  # def update
  #   if @item.update(item_params)
  #     redirect_to @item, notice: 'Item was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to items_url, notice: 'Item was successfully destroyed.'
  # end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_describe, :category_id, :condition_id, :delivery_charge_id, :delivery_region_id, :delivery_day_id, :price, :image)
  end
end
