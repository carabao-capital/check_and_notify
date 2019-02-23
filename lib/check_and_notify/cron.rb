module CheckAndNotify
  class Cron
    def self.init
      init_every_hour_cron
      init_every_ten_minutes_cron
      init_every_thirty_minutes_cron
      init_every_one_minute_cron
    end

    private

    def self.init_every_hour_cron
      Sidekiq::Cron::Job.create({
        name: 'CheckEveryHourWorker',
        cron: '0 * * * *',
        class: 'CheckAndNotify::Workers::CheckEveryHourWorker'
      })
    end

    def self.init_every_ten_minutes_cron
      Sidekiq::Cron::Job.create({
        name: 'CheckEveryTenMinutesWorker',
        cron: '*/10 * * * *',
        class: 'CheckAndNotify::Workers::CheckEveryTenMinutesWorker'
      })
    end

    def self.init_every_thirty_minutes_cron
      Sidekiq::Cron::Job.create({
        name: 'CheckEveryThirtyMinutesWorker',
        cron: '*/30 * * * *',
        class: 'CheckAndNotify::Workers::CheckEveryThirtyMinutesWorker'
      })
    end

    def self.init_every_one_minute_cron
      Sidekiq::Cron::Job.create({
        name: 'CheckEveryOneMinuteWorker',
        cron: '*/1 * * * *',
        class: 'CheckAndNotify::Workers::CheckEveryOneMinuteWorker'
      })
    end
  end
end
