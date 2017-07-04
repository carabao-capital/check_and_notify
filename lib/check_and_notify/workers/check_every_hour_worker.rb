module CheckAndNotify
  module Workers
    class CheckEveryHourWorker
      include Sidekiq::Worker

      def perform
        callbacks_size = CheckAndNotify::Callbacks.
          check_after_one_hour_callbacks.count

        callbacks_size.times do |index|
          SlackNotifierWorker.perform_async(
            index, SlackNotifierWorker::EVERY_HOUR
          )
        end
      end
    end
  end
end
