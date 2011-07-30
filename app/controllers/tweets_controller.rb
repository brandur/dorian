class TweetsController < ApplicationController
  caches_page :index

  def index
    @tweets = Tweet.all
    @tweet_stats = Tweet.count_by('published_at', :group_by => 'month')
  end
end
