# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportGeneration::GenerateCsvService, type: :service do
  describe 'should be generate csv' do
    context 'with valid values' do
      FILENAME = 'companies_per_user'
      let(:companies) { create_list(:company, 10) }

      let(:headers) { 'Id;Name;UserCount' }
      let(:rows) do
        values = []
        companies.each do |company|
          values << "#{company.id};#{company.name};#{company.users.count}"
        end
        values
      end

      let(:klass) { described_class.new(headers, rows, FILENAME) }
      let(:csv_file) { klass.generate_csv }

      context 'should be create csv' do
        it 'creates CSV file with proper value in rows' do
          rows.each_with_index do |row, index|
            next if index == 1
            expect(csv_file[index]).to eq(row)
          end
        end
      end

      context 'get path from env' do
        it 'development' do
          allow(Rails.env).to receive(:development?).and_return(true)

          expect(klass.generate_file).to eq("#{Rails.root}/public/#{FILENAME}.csv")
        end
        it 'test' do
          allow(Rails.env).to receive(:test).and_return(true)

          expect(klass.generate_file).to eq("#{Rails.root}/spec/fixtures/reports/#{FILENAME}.csv")
        end
      end
    end
  end
end
