require "./analytics" 

class Population
attr_reader :key
  def initialize
    self.analytics
  end

  def analytics
    @analytics ||= Analytics.new
  end

  def analytics_prompt
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