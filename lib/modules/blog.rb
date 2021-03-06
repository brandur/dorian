require 'module_base'
require 'rss_helper'

class Blog < ModuleBase
  include RssHelper

  def update
    num_updates = 0
    rss_for(config.atom) do |item|
      tweet = Article.new :title => item.title.content, 
        :permalink    => item.link.href, 
        :published_at => Time.parse(item.published.to_s)
      if tweet.valid?
        tweet.save
        num_updates += 1
      end
    end
    Slides.log :fetched, articles: num_updates
  end
end
