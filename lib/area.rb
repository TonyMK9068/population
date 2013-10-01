
require "./csv_reader"

class Area
attr_accessor :array_of_hash, :formatted_key_array
  def initialize
    @formatted_key_array=[]
    @array_of_hash =[]
    self.csvreader.rows_to_array('/home/vagrant/rubydocs/population/lib/populationcsv.csv')
    self.create_hash_array
  end

  def csvreader
    @csvreader ||= CSVreader.new
  end

  def formatt_key_array
    @key_array = csvreader.csv_array[0]    #defines and formats key array  
    @formatted_key_array = @key_array.map! do |object|  #@formatted_key_array now is key_array
      object.downcase
    end
  end
 
  def define_value_arrays   #delets the from csv_array the array at index 0, which will be set to key values
    csvreader.csv_array.delete_at(0)   #returns deleted array... #checks
    csvreader.csv_array
  end

  def create_hash_array   #sets @array_of_hash to equal an array of hashes where @formatted_key_arrayy is the key and arrays in csv_array are the value
    self.formatt_key_array
    self.define_value_arrays
    csvreader.csv_array.each do |b|
      @array_of_hash << Hash[@formatted_key_array.zip b]
    end
    @array_of_hash
  end
end