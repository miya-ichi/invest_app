class StocksController < ApplicationController
  def index
    @stocks = params[:q] ? Stock.where('name LIKE ?', "%#{params[:q]}%").or(Stock.where('code LIKE ?', "%#{params[:q]}%")) : Stock.all

    respond_to do |format|
      format.html
      format.json {
        render json: @stocks.map { |s| { id: s.id, name: "#{s.code}:#{s.name}" } }
      }
    end
  end
end
