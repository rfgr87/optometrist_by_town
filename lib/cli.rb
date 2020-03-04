require_relative "./optometrist_by_town.rb"


class OptometristByTown::CLI
  
  def call 
    puts "Hello. Welcome to the Optometrist By Town finder"
    puts "Please type a Puertorican town were you would like to locate an optometrist office"
    puts "When finished type exit to end the program"
    @input = gets.chomp
    while @input != "exit"
      @find_office = OptometristByTown::FindOffice.new(@input)
      @office = @find_office.find_office #array of one to more offices, if none then zero length
      @n_offices = @find_office.amount_of_offices_in_town
      if @n_offices > 0 
        if @n_offices == 1
          puts "There is #{@n_offices} offices in #{@find_office.town}."
          i = 0 
          while i < @n_offices
            puts "#{i+1}."
            puts "  #{@office[i].town}"
            puts "  #{@office[i].name}"
            puts "  #{@office[i].address}"
            puts "  #{@office[i].number}"
            if !@office[i].webpage == false 
              puts "  #{@office[i].webpage}"
            end 
            puts ""
            i += 1
          end
        else
          puts "There are #{@n_offices} offices in #{@find_office.town}."
          i = 0 
          while i < @n_offices
            puts "#{i+1}."
            puts "  #{@office[i].town}"
            puts "  #{@office[i].name}"
            puts "  #{@office[i].address}"
            puts "  #{@office[i].number}"
            if !@office[i].webpage == false 
              puts "  #{@office[i].webpage}"
            end 
            puts ""
            i += 1
          end
        end
      else 
        puts "No optometrist offices were found in that town."
        puts "Please select another nearest town to your desired location."
      end
      @input = gets.chomp
    end
  end
end








