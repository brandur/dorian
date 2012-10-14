require 'module_base'
require 'json_helper'

class Twitter < ModuleBase
  include JsonHelper

  def update
    num_updates = 0
    json_for("https://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{config.user}") do |json|
      json.each do |item|
        tweet = Tweet.new :content => item["text"],
          :permalink => "http://twitter.com/#{config.user}/statuses/#{item["id"]}",
          :published_at => Time.parse(item["created_at"])
        if tweet.valid?
          tweet.save
          num_updates += 1
        end
      end
    end
    Slides.log :fetched, tweets: num_updates
  end
end
