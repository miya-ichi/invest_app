namespace :stock_prices do
  desc '日本の株価情報を取得する'
  task update_jp: :environment do
    # 株価を取得する銘柄を取得
    stock_ids = Possession.select(:stock_id).distinct.pluck(:stock_id)
    stocks = Stock.where(id: stock_ids, category: 0)

    stocks.each do |stock|
      if stock.prices.last.date < Time.zone.today
        # 今日の株価が未取得なら、DBに登録する
        stock.set_prices
      else
        # 今日の株価が取得済みなら、DBを更新する
        stock.update_prices
      end
      sleep(1)
    end
  end

  desc '米国の株価情報を取得する'
  task update_us: :environment do
    # 株価を取得する銘柄を取得
    stock_ids = Possession.select(:stock_id).distinct.pluck(:stock_id)
    stocks = Stock.where(id: stock_ids, category: 1)

    # 日本時間の夜間でDBのレコードが切り替わらないようにUTCで実行する
    Time.use_zone('UTC') do
      stocks.each do |stock|
        if stock.prices.last.date < Time.zone.today
          # 今日の株価が未取得なら、DBに登録する
          stock.set_prices
        else
          # 今日の株価が取得済みなら、DBを更新する
          stock.update_prices
        end
        sleep(1)
      end
    end
  end
end
