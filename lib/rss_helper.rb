require 'rss'

module RssHelper
  def rss_for(uri)
    rss = RSS::Parser.parse(open(uri).read, false)
    rss.items.each do |item|
      yield item
    end
  end
end
