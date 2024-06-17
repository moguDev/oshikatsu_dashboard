class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top; end

  def dashboard
    @today = Date.today
    @items = Item.where(user_id: current_user.id)
    @items_in_past = @items.where('start_date < ?', @today)
    @next_item = @items.where('start_date >= ?', @today).order(:start_date).first
    @today_items = @items.where('start_date >= ? AND end_date <= ?', @today, @today)

    @q = Item.ransack(params[:q])
    @our_items = @q.result(distinct: true).where.not(user_id: current_user.id).where('start_date >= ?', @today).where(is_private: false).order(created_at: :desc)
    @our_items_count = 0; @our_items_count = @our_items.count if @our_items.present?
    @our_items = @our_items.page(params[:page]).per(5)
  end
end
