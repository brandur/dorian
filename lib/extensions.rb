module Enumerable
  def intersperse(obj=nil)
    map {|el| [obj, el] }.flatten(1).drop(1)
  end
end
