class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top; end

  def dashboard
    @today = Date.today
    suggests = Suggest.all.to_a
    if suggests.present?
      seed = @today.strftime('%Y%m%d').to_i
      idx = seed % suggests.size
      @suggest = suggests[idx]
    end
    
    @items = Item.where(user_id: current_user.id)
    @items_in_future = @items.where('start_date >= ?', @today)
    @items_in_past = @items.where('start_date < ?', @today)
    @next_item = @items.where('start_date >= ?', @today).order(:start_date).first
    @today_items = @items.where('start_date <= ? AND end_date >= ?', @today, @today)
    @liked_count = 0
    @items.each { |item| @liked_count += Good.where(item_id: item.id).count }
    @oshi = Item.where(user_id: current_user.id).group(:oshi).order('count_all DESC').limit(3).count

    @q = Item.ransack(params[:q])
    @our_items = @q.result(distinct: true).includes(:user).where.not(user_id: current_user.id).where(is_private: false).order(created_at: :desc)
    @our_items_count = 0; @our_items_count = @our_items.count if @our_items.present?
    @our_items = @our_items.page(params[:page]).per(5)
  end
end
