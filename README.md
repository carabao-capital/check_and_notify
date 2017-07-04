# Check And Notify

An easy to use regular checker and notifier via Slack without needing to setup cron jobs and rake tasks.
This gem uses Sidekiq and Sidekiq Cron for asynchronous execution of jobs.

In the future, other medium of notifications will be implemented like Email and SMS.

### Installation

```sh
$ gem install check_and_notify
```

### Usage

In your initializer, say for example, `check_and_notify.rb`, write a callback that will be called every ten minutes and then send a notification:

```ruby
require 'check_and_notify'

CheckAndNotify::Callbacks.check_after_ten_minutes do
    # Do anything here
    message = "Hello World"

    {
      slack_webhook_url: "https://hooks.slack.com/services/111/222/abcd",
      message: message
    }
  end
end

CheckAndNotify.init_cron
```

Remember that the return of the callback must be of the form: `{slack_webhook_url: "", message: ""}`.
Also remember to call `CheckAndNotify.init_cron` to initialize Sidekiq crons.

You can add multiple callbacks if you want:

```ruby
require 'check_and_notify'

CheckAndNotify::Callbacks.check_after_ten_minutes do
    # Do anything here
    message = "Hello James"

    {
      slack_webhook_url: "https://hooks.slack.com/services/333/444/abcd",
      message: message
    }
  end
end

CheckAndNotify::Callbacks.check_after_ten_minutes do
    # Do anything here
    message = "Hello World"

    {
      slack_webhook_url: "https://hooks.slack.com/services/111/222/abcd",
      message: message
    }
  end
end

CheckAndNotify.init_cron
```

### Todos

- Write checkers after every five minutes, fifteen minutes, thirty minutes, and so forth as long as there's a demand for it

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
