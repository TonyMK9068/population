require "./area"
require "./csv_reader"
#require './analytics'
class Setup

  def initialize

  end

  def area 
    @area ||= Area.new
  end

  def filter_by_state(input)
    area.array_of_hash.collect do |array|
      if array[:state] = input.downcase
        print array["zipcode"]
      end
    end
  end
end
