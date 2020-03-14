class OptometristByTown::Office
  attr_accessor :town, :name, :number, :address, :webpage
   @@all = []
   
  def initialize
    @offices_in_town = []
  end
   
  def find_by_town(input)
    @offices = OptometristByTown::FindOffice.new(input)
    @offices_in_town = @offices.find_office
    @offices_in_town
  end
  
  def offices_in_town
    @offices_in_town
  end
  
  def office_count
    @offices_in_town.length 
  end
    
  def save
    @@all << self
  end
   
   def all
     @@all
   end
 end