class GithubAction < ActiveRecord::Base
  default_scope :order => 'published_at DESC'
  validates_presence_of :github_id, :title, :permalink, :published_at, :content
  validates_uniqueness_of :github_id

  def content_html
    c = content.gsub /href\s*=\s*["'](.*?)["']/, 'href="https://github.com\1"'
    c
  end
end
