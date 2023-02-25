class PossessionsController < ApplicationController
  def index
    @possessions = current_user.possessions.all.order(created_at: :desc)
  end

  def new
    @possession = current_user.possessions.build
  end

  def create
    @possession = current_user.possessions.build(possession_params)

    if @possession.save
      @possession.stock.set_prices
      flash.now[:success] = "「#{@possession.stock.name}」を保有銘柄に追加しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def possession_params
    params.require(:possession).permit(:stock_id, :price, :volume, :memo)
  end
end
