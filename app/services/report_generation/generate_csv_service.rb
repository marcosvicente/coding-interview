# frozen_string_literal: true

require 'csv'
module ReportGeneration
  class GenerateCsvService
    def initialize(headers, rows, filename)
      @headers = headers
      @rows = rows
      @filename = filename
    end

    def generate_csv
      CSV.open(generate_file, 'w', headers: true) do |csv|
        csv << [@headers]
        @rows.each do |row|
          csv << [row]
        end
      end
    end

    def generate_file
      if Rails.env.development?
        "#{Rails.root}/public/#{@filename}.csv"
      elsif Rails.env.test?
        "#{Rails.root}/spec/fixtures/reports/#{@filename}.csv"
      end
    end
  end
end
