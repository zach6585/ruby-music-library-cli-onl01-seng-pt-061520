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
     artista = Artist.new(artist)
     artista.save
     artista 
   end 
   
   def songs
     @songs 
   end 
   
   
   
  def genres
    @songs
   end 
end 



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
   def self.create(artist)
     art = Arrist.new(artist)
     art.save
     art 
   end 
   
   def songs
     @songs 
   end 
   
   def add_song(song)
     if song.artist == nil 
      song.artist = self
      if !@songs.include?(song)
        @songs << song 
      end 
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



