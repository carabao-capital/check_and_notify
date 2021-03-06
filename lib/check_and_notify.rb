require "active_support"
require "httparty"
require "sidekiq"
require "sidekiq-cron"

require "check_and_notify/version"
require "check_and_notify/cron"
require "check_and_notify/callbacks"
require "check_and_notify/notifiers/slack"
require "check_and_notify/workers/slack_notifier_worker"
require "check_and_notify/workers/check_every_hour_worker"
require "check_and_notify/workers/check_every_thirty_minutes_worker"
require "check_and_notify/workers/check_every_ten_minutes_worker"
require "check_and_notify/workers/check_every_one_minute_worker"

module CheckAndNotify
  def self.init_cron
    Cron.init
  end
end
