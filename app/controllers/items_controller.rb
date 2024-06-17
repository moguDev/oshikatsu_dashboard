class ItemsController < ApplicationController

  def index
    today = Date.today
    @items = current_user.items.where('start_date >= ? OR end_date >= ?', today, today).order(:start_date).page(params[:page]).per(10)
  end

  def past
    today = Date.today
    @items = current_user.items.where('end_date < ?', today).order(end_date: :desc).page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to dashboard_path, success: t('items.create.success')
    else
      render :new, status: :unprocessable_entity, danger: t('items.create.failure')
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to dashboard_path, success: t('items.update.success')
    else
      render :edit, status: :unprocessable_entity, danger: t('items.update.failure')
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:is_private, :title, :oshi, :start_date, :end_date, :locate, :url, :ticket).merge(user_id: current_user.id)
  end
end
