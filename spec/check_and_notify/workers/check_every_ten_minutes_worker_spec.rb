require "spec_helper"

module CheckAndNotify
  module Workers
    describe CheckEveryTenMinutesWorker do
      let(:callback_return_1) do
        {slack_webhook_url: "slack_webhook_url", message: "message"}
      end

      let(:callback_return_2) do
        false
      end

      before(:each) do
        [
          callback_return_1,
          callback_return_2
        ].each do |callback_return|
          CheckAndNotify::Callbacks.check_after_ten_minutes do
            callback_return
          end
        end
      end

      it "traverses callbacks array and fire up worker" do
        allow(HTTParty).to receive(:post).
          and_return true
        allow(
          CheckAndNotify::Callbacks.
            check_after_ten_minutes_callbacks
        ).to receive(:size)

        expect(
          Workers::SlackNotifierWorker
        ).to receive(:perform_async).with(
          0, SlackNotifierWorker::EVERY_TEN_MINUTES
        )

        expect(
          Workers::SlackNotifierWorker
        ).to receive(:perform_async).with(
          1, SlackNotifierWorker::EVERY_TEN_MINUTES
        )

        described_class.perform_async
      end
    end
  end
end
