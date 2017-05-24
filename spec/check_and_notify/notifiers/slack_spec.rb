require "spec_helper"

module CheckAndNotify
  module Notifiers
    describe Slack do
      let(:slack_webhook_url) { "slack_webhook_url" }
      let(:message) { "message" }
      let(:headers) do
        {"Content-Type" => "application/json"}
      end
      let(:body) do
        {text: message}.to_json
      end

      let(:params) do
        {
          slack_webhook_url: slack_webhook_url,
          message: message,
        }
      end

      it "notifies slack" do
        allow(HTTParty).to receive(:post).with(slack_webhook_url, {
          headers: headers,
          body: body
        }).and_return true

        CheckAndNotify::Notifiers::Slack.notify(params)
      end
    end
  end
end
