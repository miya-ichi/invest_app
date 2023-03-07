class PossessionsController < ApplicationController
  def index
    @possessions = current_user.possessions.all.order(created_at: :desc)
  end

  def new
    @possession = current_user.possessions.build
  end

  def edit
    @possession = current_user.possessions.find(params[:id])
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

  def update
    @possession = current_user.possessions.find(params[:id])

    if @possession.update(possession_params)
      flash.now[:success] = "保有銘柄「#{@possession.stock.name}」を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @possession = current_user.possessions.find(params[:id])

    @possession.destroy!
    flash.now[:success] = "保有銘柄「#{@possession.stock.name}」を削除しました。"
  end

  private

  def possession_params
    params.require(:possession).permit(:stock_id, :price, :volume, :memo)
  end
end
