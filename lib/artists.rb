class Artist 
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
   def self.create(artist)
     art = Artist.new(artist)
     art.save
     art 
   end 
   
   def songs
     @songs 
   end 
   
   def add_song(song)
     if song.artist == nil 
      song.artist = self
    end 
      if !@songs.include?(song)
        @songs << song 
      end 
   end 
   
   def genres
     b = []
     @songs.each do |song|
       if !b.include?(song.genre)
         b << song.genre 
       end 
      end
      b 
    end 
    
   
end 



