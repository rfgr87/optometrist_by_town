class OptometristByTown::Office
  attr_accessor :town, :name, :number, :address, :webpage
   @@all = []
   
  def initialize
  end
  
  def self.office_count
    @@all.size
  end
    
  def self.clear
    @@all = []
  end
  
  def save
    @@all << self
  end
   
   def self.all
     @@all
   end
 end
