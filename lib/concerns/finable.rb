module Concerns::Findable
  
  def find_by_name(name)
    all.each do |elem|
      if elem.name == name
        return elem 
      end 
    end 
    return nil 
  end 
  
  def find_or_create_by_name(name)
   a = find_by_name(name)
   if a == nil 
     create(name)
   else 
     a 
   end 
 end 
end 