require 'module_base'
require 'rss_helper'

class Twitter < ModuleBase
  include RssHelper

  def update
    num_updates = 0
    rss_for("http://twitter.com/statuses/user_timeline/#{config.user}.rss") do |item|
      tweet = Tweet.new :content => item.title.gsub(/^[^:]+: /, ''), 
        :permalink => item.link, 
        :published_at => Time.parse(item.date.to_s)
      if tweet.valid?
        tweet.save
        num_updates += 1
        expire
      end
    end
    puts "Fetched #{num_updates} new tweet(s)"
  end

private

  def expire
    expire_page '/'
    expire_page '/twitter'
  end
end
