# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportGeneration::CompaniesPerUserService, type: :service do
  describe 'should be generate csv' do
    FILENAME = 'companies_per_user'

    context 'with valid values' do
      let!(:companies) { create_list(:company, 20) }
      let(:headers) { 'Id;Name;UserCount' }
      let(:rows) do
        values = []
        companies.each do |company|
          values << "#{company.id};#{company.name};#{company.users.count}"
        end
        values
      end

      let(:klass) { described_class.new }
      let(:csv_file) { klass.call }

      context 'should be create csv' do
        it 'creates CSV file with proper value in rows' do
          rows.each_with_index do |row, index|
            next if index == 1

            expect(csv_file[index]).to eq(row)
          end
        end
      end
    end
  end
end
