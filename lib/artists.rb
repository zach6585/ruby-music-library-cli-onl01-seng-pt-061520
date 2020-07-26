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
   
   def add_song(song)
     if song.artist == nil 
      song.artist = self
      if !@songs.include?(song)
        @songs << song 
      end 
     end 
   end 
   
  def genres
     a = Song.all.select{|song| song.artist = self}
     a.each do |song|
       add_song(song)
     end 
     b = []
     @songs.each do |song|
       b << song.genre
     end 
     b
   end 
end 

