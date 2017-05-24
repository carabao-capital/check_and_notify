$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "check_and_notify"
require "pry-nav"
require "sidekiq/testing"

Sidekiq::Testing.inline!


