class GoodsController < ApplicationController
  
  def create
    good = Good.new(user_id: current_user.id, item_id: params[:item_id])
    @item = good.item
    good.save
  end

  def destroy
    good = Good.find(params[:id])
    @item = good.item
    good.destroy
  end
end
