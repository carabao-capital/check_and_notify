require "active_support"
require "httparty"
require "sidekiq"

require "check_and_notify/version"
require "check_and_notify/callbacks"
require "check_and_notify/notifiers/slack"
require "check_and_notify/workers/slack_notifier_worker"
require "check_and_notify/workers/check_every_hour_worker"

module CheckAndNotify

end
