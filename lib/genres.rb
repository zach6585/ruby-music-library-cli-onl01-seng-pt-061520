class Genre 
  attr_accessor :name 
  @@all = []
  extend Concerns::Findable 
  def initialize(name)
    @name = name 
    @songs = []
  end 
   def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  def save
     @@all << self
   end 
   def self.create(genre)
     gr = Genre.new(gr)
     gr.save
     gr 
   end 
   
   def songs
     @songs 
   end 
   
   def artists
     b = []
     @songs.each do |song|
       if !b.include?(song.artist)
         b << song.artist 
       end 
      end
      b 
    end 
    
   
end 

