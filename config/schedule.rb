# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# at: の時間指定を24時間形式にする
set :chronic_options, hours24: true

# 下の方でlogを出力するフォルダを指定する際に、Rails.rootを使うために読み込む
require File.expand_path(File.dirname(__FILE__) + '/environment')

# RAILS_ENVが指定されていなければdevelopment環境として実行したい。
rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env

# ログの出力先を指定
set :output, "#{Rails.root}/log/cron.log"

job_type :rake, "export PATH=\"/opt/homebrew/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

every :weekday, at: ['9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00'] do
  rake "stock_prices:update_jp"
end

every :weekday, at: ['22:30', '23:30', '0:30', '1:30', '2:30', '3:30', '4:30', '5:30', '6:30'] do
  rake "stock_prices:update_us"
end

every 1.day, at: '22:00' do
  rake "user:calculate_total_asset"
end
