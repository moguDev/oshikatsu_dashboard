class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top; end

  def dashboard
    @today = Date.today
    @items = Item.where(user_id: current_user.id)
    @items_in_past = @items.where('start_date < ?', @today)
    @next_item = @items.where('start_date >= ?', @today).order(:start_date).first
    @our_items = Item.where.not(user_id: current_user.id).where('start_date >= ?', @today).where(is_private: false).order(created_at: :desc).page(params[:page]).per(5)
  end
end
