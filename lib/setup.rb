require "./area"
require "./csv_reader"
#require './analytics'
class Setup

  def initialize
  end


  def analytics_response  #takes rows setup by setup.rb and runs analytics.rb methods on them
    self.analytics_prompt
    case @user_analytics
      when "a"
        puts "There are #{@array_of_hash.unique_values(@key)}\'s in America"
      when "b"
        puts "There are #{@array_of_hash.datarows.value_small}\'s in America"
      when "c" 
        puts "There are #{@array_of_hash.datarows.value_large}\'s in America"
      else
        puts "Enter a letter A through D"
        return @instance_name.analytics_prompt
    end
  end


end
