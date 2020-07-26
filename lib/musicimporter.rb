class MusicImporter 
  attr_accessor :path 
  def initialize(path)
    @path = path 
  end 
  
  def files 
    a = []
    Dir.entries(@path).each do |song|
      if song.include?("mp3")
        a << song 
      end 
    end 
    a
  end 
  
 
    
end 