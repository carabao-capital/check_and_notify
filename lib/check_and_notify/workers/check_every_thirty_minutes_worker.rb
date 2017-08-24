module CheckAndNotify
  module Workers
    class CheckEveryThirtyMinutesWorker
      include Sidekiq::Worker
      sidekiq_options retry: 1

      def perform
        callbacks_size = CheckAndNotify::Callbacks.
          check_after_thirty_minutes_callbacks.count

        callbacks_size.times do |index|
          SlackNotifierWorker.perform_async(
            index, SlackNotifierWorker::EVERY_THIRTY_MINUTES
          )
        end
      end
    end
  end
end
