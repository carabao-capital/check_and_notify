$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "check_and_notify"
require "pry-nav"
require "sidekiq/testing"

Sidekiq::Testing.inline!

def clear_check_after_one_hour_callbacks
  CheckAndNotify::Callbacks.check_after_one_hour_callbacks = []
end

RSpec.configure do |config|
  config.before(:each) do
    clear_check_after_one_hour_callbacks
  end
end
