class MusicLibraryController
  attr_accessor :path
  def initialize(path = nil)
    @path = path
    mi = MusicImporter.new(@path)
    mi.import
  end 
end 