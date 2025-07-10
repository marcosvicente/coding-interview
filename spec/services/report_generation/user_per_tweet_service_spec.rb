require 'rails_helper'

RSpec.describe ReportGeneration::UserPerTweetService, type: :service do
    describe "should be generate csv" do
      context "with valid values" do
        let!(:tweets) { create_list(:tweet, 100)}
        let(:headers) { ["Id", "Username", "Email" "Body"] }
        let(:rows) do
          values = []
          tweets.each do |tweet|
            values << "#{tweet.id};#{tweet.user.username};#{tweet.user.email};#{tweet.body}"
          end
        end

        let(:klass) { described_class.new }
        let(:csv_file) { klass.generate_csv(headers, rows) }

        context "should be create csv" do
          it 'creates CSV file with proper value in headers' do
            binding.pry
            expect(CSV.parse_line(csv_file)[0].to_a).to eq(headers)
          end
          it 'creates CSV file with proper value in rows' do
            rows.each_with_index do |row, index|
              next if index == 1
              expect(CSV.parse(csv_file)[index][0]).to match_array(CSV.generate_line([
               rows
             ]))
          end
        end
      end
    end
  end
end
