class Song
  attr_accessor :name
  attr_reader :artist, :genre 
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil 
      self.artist=(artist)
    end 
    if genre != nil 
      self.genre=(genre)
    end 
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
   def self.create(song)
     songa = Song.new(song)
     songa.save
     songa 
   end 
   
   def artist=(artist)
     @artist = artist 
     @artist.add_song(self)
   end 
   
   def genre=(genre)
     @genre = genre 
     if !@genre.songs.include?(self)
       @genre.songs << self 
     end 
   end 
   
   def self.find_by_name(name)
     @@all.each do |song|
       if song.name == name 
         return song 
       end 
     end 
     return nil 
   end 
   
   def self.find_or_create_by_name(name)
     a = self.find_by_name(name)
     if a == nil 
       Song.create(name)
     else 
       a 
     end 
   end 
   
   def self.new_from_filename(file)
    a = file.split(" - ")
    song =Song.new(a[1])
    song.artist = Artist.find_or_create_by_name(a[0])
    song.genre = Genre.find_or_create_by_name(a[2][0...-4])
    song
  end 
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    
  end 
end 