class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :item_id_params, only: :update

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if item_params[:item_id] then
      binding.pry
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    elsif item_id_params[:item_id] then
      binding.pry
      if @my_items.update(item_id_params)
        redirect_to root_path
      else
        render :trade_new
      end
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  def item_select
    @item = Item.find(params[:item_id])
    @my_items = current_user.items
  end

  def trade_new
    @item = Item.find(params[:item_id])
    @my_items = current_user.items
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :condition_id, :pay_for_shipping_id,
                                 :ken_name_id, :shipping_days_id).merge(user_id: current_user.id)
  end

  def item_id_params
    params.require(:item).permit(:id)
    @item = Item.find(params[:item_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end