class TweetsController < ApplicationController
  caches_page :index

  def index
    @tweet_count = Tweet.count
    @tweet_count_by_month = Tweet.order('published_at ASC').count_by{|t| t.published_at.beginning_of_month}
    @tweets_by_year = Tweet.ordered.reverse.group_by{|t| t.published_at.year}
  end
end
