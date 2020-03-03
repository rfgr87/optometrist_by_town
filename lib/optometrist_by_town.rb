require_relative "optometrist_by_town/version"
require_relative "./cli.rb"

 module OptometristByTown
   attr_accessor :town, :name, :number
   @@all = []
   
   def initialize(town=nil, name=nil, number=nil, webpage=nil)
     @town = town
     @name = name 
     @number = number
     @webpage = webpage
   end
   
   def self.save
     @@all << self
   end
   
   def self.all
     @@all
   end
 end
