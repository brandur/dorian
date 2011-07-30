class HomeController < ApplicationController
  caches_page :index

  def index
    @actions     = GithubAction.limit(5)
    @articles    = Article.limit(5)
    @book        = Book.first
    @book_stats  = Book.count_by('finished_at', :group_by => 'year')
    @fact        = Fact.first
    @fact_stats  = Fact.where('created_at > ?', 30.days.ago).count_by('created_at', :group_by => 'day')
    @tweets      = Tweet.limit(10)
    @tweet_stats = Tweet.count_by('published_at', :group_by => 'month')
  end
end
