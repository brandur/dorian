class BooksController < ApplicationController
  caches_page :index

  def index
    @book = Book.first
    @books_count = Book.count
    @books_by_year = Book.all.group_by{|t| t.finished_at.year}
    @book_stats = Book.count_by('finished_at', :group_by => 'year')
    @page_stats = Book.aggregate_by(:aggregate => 'SUM(num_pages)', 
      :aggregate_key => 'num_pages', 
      :date_column => 'finished_at', 
      :group_by => 'year')
  end
end
