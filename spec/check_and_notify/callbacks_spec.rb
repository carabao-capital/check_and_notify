require "spec_helper"

module CheckAndNotify
  module Callbacks
    describe "collects callbacks" do
      let(:return_hash) do
        {slack_webhook_url: "slack_webhook_url", message: "message"}
      end

      before(:each) do
        CheckAndNotify::Callbacks.check_after_one_hour do
          return_hash
        end
      end

      specify do
        callbacks = CheckAndNotify::Callbacks.check_after_one_hour_callbacks
        expect(callbacks.first.call).to eq return_hash
      end
    end
  end
end
