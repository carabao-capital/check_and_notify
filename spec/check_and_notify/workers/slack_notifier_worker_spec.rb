require "spec_helper"

module CheckAndNotify
  module Workers
    describe SlackNotifierWorker do
      let(:callback) { double }
      let(:result) { double }

      before(:each) do
        CheckAndNotify::Callbacks.
          check_after_one_hour_callbacks = [callback]
      end

      it "runs" do
        expect(callback).to receive(:call).
          and_return(result)
        expect(Notifiers::Slack).to receive(:notify).
          with(result)

        described_class.perform_async(
          0, SlackNotifierWorker::EVERY_HOUR
        )
      end
    end
  end
end
