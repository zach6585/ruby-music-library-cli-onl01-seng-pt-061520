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
    end 
      a = a.sort_by { |key| key }.to_h
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.artist.name} - #{v.name} - #{v.genre.name}"
      i +=1 
    end 
  end 
  
  def list_artists
    a = {}
    Artist.all.each do |artist| 
      a[artist.name] = artist
      a = a.sort_by { |key| key }.to_h
    end 
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.name}"
      i +=1 
    end 
  end 
  
  def list_genres
    a = {}
    Genre.all.each do |genre| 
      a[genre.name] = genre
      a = a.sort_by { |key| key }.to_h
    end 
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.name}"
      i +=1 
    end
  end 
  
  def list_songs_by_artist
    a = {}
    puts "Please enter the name of an artist:"
    art = gets 
    b = Song.all.select{|song| song.artist.name == art}
    b.each do |song| 
      a[song.name] = song
    end 
    a = a.sort_by { |key| key }.to_h
    
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.name} - #{v.genre.name}"
      i +=1 
    end 
  end 
  
  def list_songs_by_genre
    a = {}
    puts "Please enter the name of a genre:"
    gen = gets 
    b = Song.all.select{|song| song.genre.name == gen}
    b.each do |song| 
      a[song.name] = song
    end 
    a = a.sort_by { |key| key }.to_h
    
    i = 1
    a.each do |k,v|
      puts "#{i}. #{v.artist.name} - #{v.name}"
      i +=1 
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    sg = gets 
    if 1 <= sg.to_i && sg.to_i <= Song.all.length 
      a = {}
      Song.all.each do |song| 
        a[song.name] = song
      end 
      a = a.sort_by { |key| key }.to_h
      c = []
      a.each do |k,v|
        c << v 
      end 
      b = c[sg.to_i-1]
    puts "Playing #{b.name} by #{b.artist.name}"
    end 
  end 
end 
