class ReportsController < ApplicationController
  def index
    CompaniesPerUserWorker.perform_async
    UserPerTweetWorker.perform_async
  end

  def companies_per_user
    send_file(
      "#{Rails.root}/public/companies_per_user.csv",
      filename: "companies_per_user.csv",
      type: "application/csv"
    )
  end

  def user_per_tweet
    send_file(
      "#{Rails.root}/public/user_per_tweet.csv",
      filename: "user_per_tweet.csv",
      type: "application/csv"
    )
  end
end