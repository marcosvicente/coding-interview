# frozen_string_literal: true

require 'csv'

module ReportGeneration
  class UserPerTweetService
    FILENAME = 'user_per_tweet'
    def call
      headers = 'Id;Username;Email;Body'
      generate_csv(headers)
    end

    private

    def generate_row
      rows = []
      tweets = Tweet.all.order('created_at DESC')

      tweets.each do |tweet|
        rows << "#{tweet.id};#{tweet.user.username};#{tweet.user.email};#{tweet.body}"
      end
      rows
    end

    def generate_csv(headers)
      rows = generate_row
      ReportGeneration::GenerateCsvService.new(headers, rows, FILENAME).generate_csv
    end
  end
end
