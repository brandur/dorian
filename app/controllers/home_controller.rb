class HomeController < ApplicationController
  caches_action :index

  def index
    @actions               = GithubAction.ordered.limit(3)
    @action_count_by_month = GithubAction.order('published_at ASC')
      .count_by{|a| a.published_at.beginning_of_month}
    @articles              = Article.ordered.limit(10)
    @book                  = Book.ordered.first
    @book_count_by_year    = Book.ordered.count_by{|b| b.finished_at.beginning_of_year}
    @fact                  = Fact.ordered.first
    @fact_count_by_day     = Fact.order('first_created_at ASC')
      .where('first_created_at > ?', 30.days.ago)
      .count_by{|f| f.first_created_at.beginning_of_day}
    @tweet_count           = Tweet.not_mention.count
    @tweet_count_by_month  = Tweet.not_mention.order('published_at ASC')
      .count_by{|t| t.published_at.beginning_of_month}
    @tweets                = Tweet.not_mention.ordered.limit(10)
  end
end
