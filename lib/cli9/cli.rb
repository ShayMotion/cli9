class GuitarGallery::CLI
  def call
    puts "\nWelcome To The Guitar Gallery\n"
  get_guitars
  list_guitars
  get_user_guitar
  end
  
  def get_guitars
    #to be scraped instead
     @guitars = GuitarGallery::Guitar.all
  end
  
  def list_guitars
     @guitars.all.each.with_index(1) do |guitar, index|
        puts "#{index}. #{guitar.name}" 
     end
  end

  def get_user_guitar
    puts "Select A Guitar By Entering a Number From 1-10."
    chosen_guitar = gets.strip
    if valid_input(chosen_guitar.to_i, @guitars) 
      show_guitars_for(chosen_guitar)
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i < 0  
  end

  def show_guitars_for(chosen_guitar)
    guitar = @guitars[chosen_guitar - 1]
    puts "Excellent Choice! Rock on!"
    guitars.Custom_Guitars.each.with_index(1) do |guitar, idx|
      puts "#{idx}. #{guitar.name}"
      puts #{guitar.rating}
      puts #{guitar.summary}
    end
  end

  def learn_more(guitar)
    puts "Check Out Another Guitar(Y/N)?"
    input = "nil"
    until input == "Y" || input == "N"
     puts "type Y(yes) or N(no) "
     input = gets.strip.upcase
    end
    if input == "y"
     puts "Select Again"
     list_guitars
    elsif input == "n"
     puts "Rock on! Goodbye."
    end
  end
end