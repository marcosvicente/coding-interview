# frozen_string_literal: true

class UserPerTweetWorker
  include Sidekiq::Worker

  def perform
    ReportGeneration::UserPerTweetService.new.call
  end
end
