require "./area"

class Analytics 
attr_accessor :value_small, :value_large, :sorted_key
  def initialize
    @sorted_key =[]
    @value_small, @value_large = [], []
    @state_values=[]
  end

  def area
   @area ||= Area.new
  end

  def sort_by_key(input)  #returns an array of all values from hashes for selected key
    @sorted_key = area.array_of_hash.collect { |array| array[input]}
  end
  

  def only_unique_values(input) #for @key
    self.sort_by_key(input)
    @sorted_key.uniq.length
  end

  def smallest(input)
    self.sort_by_key(input).sort.first
  end

  def largest(input)
    self.sort_by_key(input).sort.last
   end

  def filter_by_state(input)
    area.array_of_hash.collect do |array|
      if array["state"] == input
        @state_values << array["zipcode"]
      end
    end
    @state_values.uniq.length
  end
end