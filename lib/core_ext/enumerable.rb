module Enumerable
  def count_by
    assoc = ActiveSupport::OrderedHash.new

    each do |element|
      key = yield(element)

      if assoc.has_key?(key)
        assoc[key] += 1
      else
        assoc[key] = 1
      end
    end

    assoc
  end
end
