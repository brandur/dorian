require 'module_base'
require 'rss_helper'

class Blog < ModuleBase
  include RssHelper

  def expire
    expire_page '/'
  end

  def update
    num_updates = 0
    rss_for(config.atom) do |item|
      tweet = Article.new :title => item.title.content, 
        :permalink    => item.link.href, 
        :published_at => Time.parse(item.published.to_s)
      if tweet.valid?
        tweet.save
        num_updates += 1
        expire
      end
    end
    puts "Fetched #{num_updates} new article(s)"
  end
end
