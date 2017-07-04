module CheckAndNotify
  module Workers
    class CheckEveryTenMinutesWorker
      include Sidekiq::Worker
      sidekiq_options retry: 1

      def perform
        callbacks_size = CheckAndNotify::Callbacks.
          check_after_ten_minutes_callbacks.count

        callbacks_size.times do |index|
          SlackNotifierWorker.perform_async(
            index, SlackNotifierWorker::EVERY_TEN_MINUTES
          )
        end
      end
    end
  end
end
