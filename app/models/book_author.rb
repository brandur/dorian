class BookAuthor < ActiveRecord::Base
  belongs_to :book
  default_scope :order => 'name ASC'
  validates_presence_of :name
end
