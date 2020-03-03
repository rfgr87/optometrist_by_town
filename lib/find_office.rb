require 'nokogiri'
require 'open-uri'

class OptometristByTown::FindOffice
  attr_accessor :town

  def initialize(town)
    @url = url
    @doc = Nokogiri::HTML(open("https://www.opticaspr.com/pueblos_todos.php"))
    @town = town.downcase
    @offices_in_town = []
  end
  
  def self.find_office
    @doc.css(" big path ").each do |elements|
      elements.each do |office|
        if office.css(" precise path to towns").text.downcase == @town
          @office_url = office.css("precis path to office profile url").map { |link| link['href'] }
          @office_detail_page = Nokogiri::HTML(open(@office_url))
          @office = OptometristByTown.new
          @office.town = @office_detail_page.css("precise path to town").text
          @office.name = @office_detail_page.css("precise path to name of office").text
          @office.number = @office_detail_page.css("precise path to office number").text
          @office.address = @office_detail_page.css("precise path to address").text
          if !@office_detail_page.css("precise path to webpage").map { |link| link['href'] } == false 
            @office.webpage = @office_detail_page.css("precise path to webpage").map { |link| link['href'] }
          end
          @office.save
          @offices_in_town << @office
        else 
          puts "Optometrist Office not found in that town"
          puts "Please choose another town close to the desired location"
        end 
      end
    end
    @offices_in_town
  end
  
  def offices_in_town
    self.find_office
    @offices_in_town
  end
  
  def amount_of_offices_in_town
    @offices_in_town.count
  end

end