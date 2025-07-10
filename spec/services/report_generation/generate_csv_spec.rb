require 'rails_helper'

RSpec.describe ReportGeneration::GenerateCsv, type: :service do
  describe "should be generate csv" do
    context "with valid values" do
      let!(:tweets) { create_list(:tweet, 100)}
      let(:headers) { Tweet.column_names }
      let(:rows) {  Tweet.all}

      let(:klass) { described_class.new(headers, rows) }
      let(:csv_file) { klass.generate_csv }

      context "should be create csv" do

        it 'creates CSV file with proper value in headers' do
          expect(CSV.parse(csv_file)[0].to_a).to eq(headers)
        end
        it 'creates CSV file with proper value in rows' do
          rows.each_with_index do |row, index|
            next if index == 1
            expect(CSV.parse(csv_file)[index][0]).to match_array(CSV.generate_line([
              row.attributes.values.to_s
            ]))
          end
        end
      end
    end
  end
end