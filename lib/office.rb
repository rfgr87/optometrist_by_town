class OptometristByTown::Office
   attr_accessor :town, :name, :number, :address, :webpage
   @@all = []
   
   def initialize
   end
   
   def save
     @@all << self
   end
   
   def all
     @@all
   end
 end