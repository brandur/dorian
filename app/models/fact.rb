class Fact < ActiveRecord::Base
  scope :ordered, order('first_created_at DESC')
  validates_presence_of :facts_id, :content, :first_created_at, :category_id, :category_name, :category_slug
  validates_uniqueness_of :facts_id
end
