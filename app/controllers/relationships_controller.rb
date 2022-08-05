class RelationshipsController < ApplicationController
  #before_action :relationship_params, only: [:create]

  def index
    @relationship = Relationship.new
    @trade_item = Item.find(params[:item_id])
    @my_items = current_user.items
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy

  end

  private
  def relationship_params
    #params.require(:relationship).permit(:item_id, :trade_item_id)
    params.permit(:item_id, :trade_item_id)
  end
  
  def set_item
    @item = Item.find(params[:relationship][:trade_item_id])
  end

end
