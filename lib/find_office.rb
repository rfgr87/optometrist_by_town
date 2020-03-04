require_relative "./optometrist_by_town.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

class OptometristByTown::FindOffice
  attr_accessor :town

  def initialize(town)
    @doc = Nokogiri::HTML(open("https://www.opticaspr.com/pueblos_todos.php"))
    @town = town.downcase
    @offices_in_town = []
  end
  
  #doc.css("#main div.row")[0].css("a").map{|x| x['href]}[0]    "#{x.attr('href')}"
  
  #doc.css("div.container-fluid")[0].css(".col-md-4.col-xs-4.text-right")[0].text
  def find_office
    @doc.css("#main div.row").each do |elements|
      
      elements.css("a").each do |link|
        if link.attr('href').to_s.include?(@town)
          @office_url = link.attr('href')
          @office_url = "http://www.opticaspr.com" + @office_url  
          @office_detail_page = Nokogiri::HTML(open(@office_url))
          
          @office_detail_page.css("div.container-fluid div.row").each do |x|
            

#x.css("div.col-md-3.hidden-xs.hidden-sm.text-left")[0].css("a").css('img').map{ |i| i['alt'] }[0] 
#x.css("div.col-md-3.hidden-xs.hidden-sm.text-left").css("a").css('img').map{ |i| i['alt'] }[0] 
# search('div.consultant img').map{ |img| img['alt'] }
            # NAME
            name = x.css("div.col-md-3.hidden-xs.hidden-sm.text-left").css("a").css('img').map{ |i| i['alt'] }[0] 
            
            #TOWN
            town = @town.capitalize 
            
            # ADDRESS
            y = x.css("div.col-md-4.col-xs-4.text-right")
            y.search("span").remove
            address = y.text.strip
            

            # FOR THE NUMBER WE HAVE TO GO TO ANOTHER PAGE...
            number_link = x.css("div.col-md-5.col-xs-8 a")[1].attr('href')
            number_link = "http://www.opticaspr.com" + number_link 
            number_html = Nokogiri::HTML(open(number_link))
            binding.pry
            number = number_html.css("div.row i.fa.fa-phone").first
            
            number_html.css("i.fa.fa-phone").text

            number = x.css( )
            

            if !css.(  ) == false
              webpage = css.(   ).attr('href')
            end
            @office = OptometristByTown.new
            @office.town = town
            @office.name = name
            @office.number = number
            @office.address = address
            if !x.css("precise path to webpage").attr('href').to_s == false 
            @office.webpage = webpage
            end
            @office.save
            @offices_in_town << @office
          end
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

# office = OptometristByTown::FindOffice.new("adjuntas")
# puts office.find_office





