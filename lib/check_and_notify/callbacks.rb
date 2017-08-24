module CheckAndNotify
  module Callbacks
    mattr_accessor :check_after_one_hour_callbacks
    mattr_accessor :check_after_ten_minutes_callbacks
    mattr_accessor :check_after_thirty_minutes_callbacks

    self.check_after_one_hour_callbacks = []
    self.check_after_ten_minutes_callbacks = []
    self.check_after_thirty_minutes_callbacks = []

    def self.check_after_one_hour(&block)
      self.check_after_one_hour_callbacks << block
    end

    def self.check_after_thirty_minutes(&block)
      self.check_after_thirty_minutes_callbacks << block
    end

    def self.check_after_ten_minutes(&block)
      self.check_after_ten_minutes_callbacks << block
    end
  end
end
