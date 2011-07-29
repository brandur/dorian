class Article < ActiveRecord::Base
  validates_presence_of :title, :permalink, :published_at
  validates_uniqueness_of :permalink

  default_scope :order => 'published_at DESC'
end
