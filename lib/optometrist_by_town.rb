
require_relative "optometrist_by_town/version"
require_relative "./cli.rb"
require_relative "./find_office.rb"
require 'pry'

 module OptometristByTown
   attr_accessor :town, :name, :number, :address, :webpage
   @@all = []
   
   def initialize
   end
   
   def self.save
     @@all << self
   end
   
   def self.all
     @@all
   end
 end





