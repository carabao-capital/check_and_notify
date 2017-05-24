module CheckAndNotify
  module Workers
    class SlackNotifierWorker
      include Sidekiq::Worker

      def perform(callback_index)
        callback = CheckAndNotify::Callbacks.
          check_after_one_hour_callbacks[callback_index]

        result = callback.call
        Notifiers::Slack.notify(result) if result
      end
    end
  end
end
