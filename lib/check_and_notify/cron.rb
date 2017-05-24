module CheckAndNotify
  class Cron
    def self.init
      init_every_hour_cron
    end

    private

    def self.init_every_hour_cron
      Sidekiq::Cron::Job.create({
        name: 'CheckEveryHourWorker',
        cron: '0 * * * *',
        class: 'CheckAndNotify::Workers::CheckEveryHourWorker'
      })
    end
  end
end
