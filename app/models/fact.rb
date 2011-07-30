class Fact < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  validates_presence_of :facts_id, :content, :created_at, :category_id, :category_name, :category_permalink
  validates_uniqueness_of :facts_id
end
