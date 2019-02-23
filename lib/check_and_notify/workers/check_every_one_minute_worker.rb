module CheckAndNotify
  module Workers
    class CheckEveryOneMinuteWorker
      include Sidekiq::Worker
      sidekiq_options retry: 1

      def perform
        callbacks_size = CheckAndNotify::Callbacks.
          check_after_one_minute_callbacks.count

        callbacks_size.times do |index|
          SlackNotifierWorker.perform_async(
            index, SlackNotifierWorker::EVERY_ONE_MINUTE
          )
        end
      end
    end
  end
end
