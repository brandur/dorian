class BookAuthor < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :name
end
