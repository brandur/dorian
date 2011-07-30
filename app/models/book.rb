require 'extensions'

class Book < ActiveRecord::Base
  default_scope :order => 'finished_at DESC'
  has_many :authors, :class_name => 'BookAuthor'
  validates_presence_of :goodreads_id, :title, :finished_at, :num_pages
  validates_uniqueness_of :goodreads_id

  def add_author(name)
    self.authors << BookAuthor.new(:name => name)
  end

  def author
    if self.authors.size > 1
      author_parts = self.authors.map{|a| a.name}.intersperse(', ')
      author_parts[author_parts.size - 2] = ', and '
      author_parts.join
    elsif self.authors.size == 1
      self.authors.first.name
    else
      nil
    end
  end
end
