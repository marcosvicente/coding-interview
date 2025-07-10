class UserPerTweetWorker
  include Sidekiq::Worker

  def perform
    ReportGeneration::UserPerTweetService.new.call
  end
end
