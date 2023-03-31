namespace :user do
  desc 'ユーザーの総資産を計算'
  task calculate_total_asset: :environment do
    Stock.find_by(code: 'JPY=X').set_prices
    User.joins(:possessions).distinct.find_each(&:calculate_total_asset)
  end
end
