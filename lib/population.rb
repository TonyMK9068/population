require "./area"
require "./analytics" 

class Population
attr_reader :key
  def initialize
    self.area.create_hash_array
    self.analytics
  end
=begin
  def return_individual_keys
   area.formatted_key_array.each do |element|
      puts "#{element.upcase}"
    end
  end
=end
  def area
   @area ||= Area.new
  end

  def setup
    @setup ||= Setup.new
  end

  def analytics
    @analytics ||= Analytics.new(@key)
  end

  def initial_prompt  #removed temporarily...only needed if searching for values besides zipcodes
=begin    
    p "Choose a key from the following: "
    self.return_individual_keys
    @key = gets.chomp.downcase
    until area.formatted_key_array.include?(@key)
      p "Not a valid selection. Pick an item from the above list"
      @key = gets.chomp
    end
    puts "You entered #{@key}" 
=end
  end

  #determine what the user wants to do with the zipcode
  def analytics_prompt
    self.initial_prompt 
    puts "Would you like to find..."
    puts "[A]: how many zip codes exist in the United States"
    puts "[B]: the smallest zip code"
    puts "[C]: the largest zip code" 
    puts "[D]: how many zip codes there are for a particular state"
    @user_analytics = gets.chomp.downcase 
    while @user_analytics.is_a?(String) == false || ["a","b","c","d","e"].include?(@user_analytics) == false
      puts "Not a valid choice. Enter A, B, C, D, or E"
      @user_analytics = gets.chomp.downcase
    end
    puts "You entered #{@user_analytics}"
  end

  def analytics_response
    self.analytics_prompt
    case @user_analytics
      when "a"
        puts "There are #{self.analytics.only_unique_values("zipcode")} zipcode\'s in America"
      when "b"
        puts "#{self.analytics.smallest("zipcode")} is the smallest zipcode in America"
      when "c" 
        puts "#{self.analytics.largest("zipcode")} is the largest zipcode in America"
      when "d"
        puts "Input the desired state's abbreviation (must be 2 letters)"
        @state = gets.chomp.upcase
        while @state.is_a?(String) == false || @state.length > 2 || @state.length <= 1
          puts "Not a valid entry. Try again"
          @state = gets.chomp.upcase
        end
        puts "There are #{self.analytics.filter_by_state(@state)} zipcodes in #{@state}!"
    end
  end

  def run
    self.analytics_response
  end
end


fox = Population.new.run
