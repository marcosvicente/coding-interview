# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportGeneration::UserPerTweetService, type: :service do
  describe 'should be generate csv' do
    FILENAME = 'user_per_tweet_service'

    context 'with valid values' do
      let!(:tweets) { create_list(:tweet, 20) }
      let(:headers) { %w[Id Username Email Body] }
      let(:rows) do
        values = []
        tweets.each do |tweet|
          values << "#{tweet.id};#{tweet.user.username};#{tweet.user.email};#{tweet.body}"
        end
        values
      end

      let(:klass) { described_class.new }
      let(:csv_file) { klass.call }

      context 'should be create csv' do
        it 'creates CSV file with proper value in rows' do
          rows.reverse.each_with_index do |row, index|
            next if index == 1

            expect(csv_file[index]).to eq(row)
          end
        end
      end
    end
  end
end
