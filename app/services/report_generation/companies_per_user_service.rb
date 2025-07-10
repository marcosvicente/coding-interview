# frozen_string_literal: true

module ReportGeneration
  class CompaniesPerUserService
    FILENAME = 'companies_per_user'
    def call
      headers = 'Id;Name;Cont User'

      generate_csv(headers)
    end

    private

    def generate_row
      rows = []
      companies = Company.all

      companies.each do |company|
        rows << "#{company.id};#{company.name};#{company.users.count}"
      end
      rows
    end

    def generate_csv(headers)
      rows = generate_row

      ReportGeneration::GenerateCsvService.new(headers, rows, FILENAME).generate_csv
    end
  end
end
