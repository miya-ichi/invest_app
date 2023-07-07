class StocksController < ApplicationController
  def index
    @stocks = params[:q] ? Stock.where('name ILIKE ?', "%#{params[:q]}%").or(Stock.where('code ILIKE ?', "%#{params[:q]}%")) : Stock.all

    respond_to do |format|
      format.html
      format.json do
        render json: @stocks.map { |s| { id: s.id, name: "#{s.code}:#{s.name}" } }
      end
    end
  end
end
