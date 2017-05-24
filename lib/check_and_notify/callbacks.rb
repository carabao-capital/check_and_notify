module CheckAndNotify
  module Callbacks
    mattr_accessor :check_after_one_hour_callbacks
    self.check_after_one_hour_callbacks = []

    def self.check_after_one_hour(&block)
      self.check_after_one_hour_callbacks << block
    end
  end
end
