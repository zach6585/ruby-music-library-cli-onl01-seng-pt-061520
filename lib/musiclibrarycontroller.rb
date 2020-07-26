class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    mi = MusicImporter.new(@path)
    mi.import
  end 
  
  def call 
    i = 0 
    while i == 0
      puts 'Welcome to your music library!'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      name = gets
      if name == 'exit'
        i +=1 
      end 
    end 
  end 
  
  def list_songs 
    a = {}
    Song.all.each do |song| 
      a[song.name] = song
      a = a.sort_by { |key| key }.to_h
    end 
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.artist.name} - #{v.name} - #{v.genre.name}"
      i +=1 
    end 
  end 
end 
