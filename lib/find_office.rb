require_relative "./optometrist_by_town.rb"

require 'nokogiri'
require 'open-uri'

class OptometristByTown::FindOffice
  attr_accessor :town

  def initialize(town)
    @doc = Nokogiri::HTML(open("https://www.opticaspr.com/pueblos_todos.php"))
    if town.split.length > 1 
      @town = town.split
      @town = @town.join("-")
      @town = @town.downcase
    else 
      @town = town.downcase
    end
    @offices_in_town = []
  end
  
  def find_office
    @doc.css("#main div.row").each do |elements|
      
      elements.css("a").each do |link|
        if link.attr('href').include?(@town)
          @office_url = link.attr('href')
          @office_url = "http://www.opticaspr.com" + @office_url  
          @office_detail_page = Nokogiri::HTML(open(@office_url))
          @office_detail_page.css("div.container-fluid div.row").each do |x|
            
            # NAME
            name = x.css("div.col-md-3.hidden-xs.hidden-sm.text-left").css("a").css('img').map{ |i| i['alt'] }[0] 
                  

            #TOWN
            if @town.split("-").length > 1
              @town = @town.split("-").map(&:capitalize).join(' ')
              town = @town
            else
              town = @town.capitalize
            end
            
            # ADDRESS
            y = x.css("div.col-md-4.col-xs-4.text-right")
            y.search("span").remove
            address = y.text.strip
            

            # FOR THE NUMBER WE HAVE TO GO TO ANOTHER PAGE...
            # number_link = x.css("div.col-md-5.col-xs-8 a")[1].attr('href')
            # number_link = "http://www.opticaspr.com" + number_link 
            # number_html = Nokogiri::HTML(open(number_link))
            # The number did not appear after having the rigth css command
            
            @office = OptometristByTown::Office.new
            @office.town = town
            @office.name = name
            @office.address = address
            @office.save
            @offices_in_town << @office
          end
        end
      end 
    end
    @offices_in_town
  end
  
  # def offices_in_town
  #   self.find_office
  #   @offices_in_town
  # end
  
  def amount_of_offices_in_town
    @offices_in_town.count
  end

end

# office = OptometristByTown::FindOffice.new("adjuntas")
# puts office.find_office





