class Article < ActiveRecord::Base
  default_scope :order => 'published_at DESC'
  validates_presence_of :title, :permalink, :published_at
  validates_uniqueness_of :permalink
end
