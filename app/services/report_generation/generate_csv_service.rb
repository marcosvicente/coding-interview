require 'csv'
module ReportGeneration
  class GenerateCsvService
    def initialize(headers, rows, filename)
      @headers = headers
      @rows = rows
      @filename = filename
    end

    def generate_csv
      data = CSV.open(generate_file, 'w')  do |csv|
        csv << [@headers]
        @rows.each do |row|
          csv << [row]
        end
      end
      data
    end

    def generate_file
      "#{Rails.root}/public/#{@filename}.csv"
    end
  end
end
