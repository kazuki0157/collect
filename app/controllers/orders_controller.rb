class OrdersController < ApplicationController

  def index
    @nickname = current_user.nickname
    trade_items = Relationship.where(item_id: current_user.id)
    @my_item = current_user.items
    #@item = Item.find(params[:item_id])
    #@items = Item.where(id: trade_items[trade_item_id])
    #@items = Item.includes(:relationship) # Owner.allから変更
    @items = Item.where(id: trade_items.map(&:trade_item))
  end

  def show
    @item = Item.find(params[:item_id])
  end

end
