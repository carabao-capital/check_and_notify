module CheckAndNotify
  module Notifiers
    class Slack
      HEADERS = {'Content-Type' => 'application/json'}

      def self.notify(params)
        @slack_webhook_url = params[:slack_webhook_url]
        @message = params[:message]

        post
      end

      private

      def self.post
        body = {text: @message}.to_json

        HTTParty.post(@slack_webhook_url,
          headers: HEADERS,
          body: body,
        )
      end
    end
  end
end
