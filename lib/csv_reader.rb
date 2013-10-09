require 'csv'

class CSVreader
attr_accessor :csv_array
  def initialize
    @csv_array =[]
  end

  def rows_to_array(file_path = "./populationcsv.csv")
    CSV.foreach(file_path) do |row|
      @csv_array << row
    end
    @csv_array
  end
end