class BooksController < ApplicationController
  caches_action :index

  def index
    @book = Book.ordered.first
    @books_count = Book.ordered.count
    @books_by_year = Book.ordered.group_by{|t| t.finished_at.year}
    @book_count_by_year = Book.ordered.count_by{|b| b.finished_at.beginning_of_year}
    @page_count_by_year = Book.ordered.group_by{|b| b.finished_at.beginning_of_year}
    @page_count_by_year.merge!(@page_count_by_year){|k, v| v.sum(&:num_pages)}
  end
end
