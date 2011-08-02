class TweetsController < ApplicationController
  caches_page :index

  def index
    @tweet_count = Tweet.count
    @tweets_by_year = Tweet.all.group_by{|t| t.published_at.year}
    @tweet_stats = Tweet.count_by('published_at', :group_by => 'month')
  end
end
