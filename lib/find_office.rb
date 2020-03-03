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
  
  def find_office
    @doc.css("div.row").each do |elements|
      elements.css("div.col-md-6 col-sm-6 col-xs-6").each do |office|
        office.css("a").each do |link|
          if link.map{ |x| x['href'] }.include?(@town)
            @office_url = link.map{|x| x['href']}
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

office = OptometristByTown::FindOffice.new("adjuntas")
puts office.find_office





