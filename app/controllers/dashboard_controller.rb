class DashboardController < ApplicationController
  before_action :require_login

  def index
    @total_assets = current_user.total_assets.group_by_day(:created_at, last: 7).sum(:price)
    @possessions = current_user.possessions.includes(stock: :prices).map do |possession|
      [possession.stock.name, possession.total_price_to_jpy]
    end
  end
end
