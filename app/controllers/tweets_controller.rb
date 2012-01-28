class TweetsController < ApplicationController
  caches_action :index

  def index
    scope = Tweet
    scope = scope.not_mention unless params[:options] == 'with_mentions'
    @tweet_count = scope.count
    @tweet_count_by_month = scope.order('published_at ASC').count_by{|t| t.published_at.beginning_of_month}
    @tweets_by_year = scope.ordered.group_by{|t| t.published_at.year}
    @tweets_by_year = @tweets_by_year.merge(@tweets_by_year){|y, ts| ts.group_by{|t| t.published_at.month}}
  end
end
