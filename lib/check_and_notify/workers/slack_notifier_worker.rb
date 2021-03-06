module CheckAndNotify
  module Workers
    class SlackNotifierWorker
      include Sidekiq::Worker
      sidekiq_options retry: 1

      EVERY_HOUR = 3600
      EVERY_THIRTY_MINUTES = 1800
      EVERY_TEN_MINUTES = 600
      EVERY_ONE_MINUTE = 60

      def perform(callback_index, callbacks_array_type)
        callback = case callbacks_array_type
          when EVERY_HOUR
            CheckAndNotify::Callbacks.
              check_after_one_hour_callbacks[callback_index]
          when EVERY_THIRTY_MINUTES
            CheckAndNotify::Callbacks.
              check_after_thirty_minutes_callbacks[callback_index]
          when EVERY_TEN_MINUTES
            CheckAndNotify::Callbacks.
              check_after_ten_minutes_callbacks[callback_index]
          when EVERY_ONE_MINUTE
            CheckAndNotify::Callbacks.
              check_after_one_minute_callbacks[callback_index]
          end

        begin
          result = callback.call
        rescue LocalJumpError => e
        end

        Notifiers::Slack.notify(result) if result
      end
    end
  end
end
