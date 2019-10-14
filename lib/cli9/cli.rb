class GuitarGallery::CLI
  def call
    puts "\nWelcome To The Guitar Gallery\n"
    puts ""
  get_guitars
  list_guitars
  get_user_guitar
  end
  
  def get_guitars
    #to be scraped instead
     @guitars = GuitarGallery::Guitar.all
  end
  
  def list_guitars
     @guitars.each.with_index(1) do |guitar, index|
        puts "#{index}. #{guitar.name}" 
     end
  end

  def get_user_guitar
    puts ""
    puts "Select A Guitar By Entering a Number From 1-10."
    chosen_guitar = gets.strip
    
    if valid_input(chosen_guitar.to_i, @guitars) 
      show_guitar(chosen_guitar)
    end
  end

  def valid_input(input, data)
     #binding.pry
    input.to_i <= data.length && input.to_i > 0 
  end

  def show_guitar(chosen_guitar)
    guitar = @guitars[chosen_guitar.to_i - 1]
    puts ""
    puts "Excellent Choice! Rock on!"
    puts ""
      puts guitar.name
      puts guitar.rating
      puts guitar.summary
      learn_more
  end

  def learn_more
    puts ""
    puts "Check Out Another Guitar(Y/N)?"
    puts ""
    input = "nil"
    until input == "Y" || input == "N"
     puts "type Y(yes) or N(no) "
     input = gets.strip.upcase
    end
    if input == "Y"
     puts "Select Again"
     call
    elsif input == "N"
    puts ""
     puts "Rock on! Goodbye."
    end
  end
end