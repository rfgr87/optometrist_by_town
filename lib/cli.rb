require_relative "./optometrist_by_town.rb"


class OptometristByTown::CLI
  
  def call 
    puts "Hello. Welcome to the Optometrist By Town finder"
    puts "Please type a Puertorican town were you would like to locate an optometrist office"
    puts "When finished type exit to end the program"
    @input = gets.chomp
    while @input != "exit"
    
    #Here the office object is instatiated and find_office is being called from office object 
    # there is an instance array variable that is collecting the array of offices in office object
    # the method of find_office object is being used inside office to do that
    
    # Instance variables have been changed to local variables also here 
    
      offices = OptometristByTown::Office.new
      offices.find_by_town(@input)
      amount_of_offices_in_town = offices.office_count
      array_of_offices = []
      array_of_offices = offices.offices_in_town
      if amount_of_offices_in_town > 0 
        self.puts_offices(amount_of_offices_in_town, array_of_offices, @input)
      else 
        puts "No optometrist offices were found in that town."
        puts "Please select another nearest town to your desired location."
      end
      @input = gets.chomp
    end
  end

# New method to output and print the offices info 

  def puts_offices(number_of_offices, array_of_offices, town)
    if number_of_offices == 1
      puts "There is #{number_of_offices} office in #{town}."
      
      # Here the each loop was used instead of the while loop:
      array_of_offices.each_with_index do |x, index|
        puts "#{index+1}."
        puts " #{x.town}"
        puts " #{x.name}"
        puts " #{x.address}"
        puts ""
      end
    else
     # puts "There are #{number_of_offices} offices in #{town}."
      array_of_offices.each_with_index do |x, index|
        puts "#{index+1}."
        puts " #{x.town}"
        puts " #{x.name}"
        puts " #{x.address}"
        puts ""
      end
    end
  end

end






