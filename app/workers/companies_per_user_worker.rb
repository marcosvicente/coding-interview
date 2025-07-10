# frozen_string_literal: true

class CompaniesPerUserWorker
  include Sidekiq::Worker

  def perform
    ReportGeneration::CompaniesPerUserService.new.call
  end
end
