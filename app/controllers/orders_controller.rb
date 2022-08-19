class OrdersController < ApplicationController
  before_action :order_params, only: :create

  def index
    trade_items = Relationship.where(item_id: current_user.id)
    @my_item = Item.find(params[:item_id])
    @items = Item.where(id: trade_items.map(&:trade_item))
  end

  def show
    @order = Order.new
    @item = Item.find(params[:item_id])
    @relationship = Relationship.find_by(item_id: params[:id], trade_item_id: params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      redirect_to root_path
      # render :show
    end
  end

  private

  def order_params
    params.permit(:relationship_id)
  end
end
