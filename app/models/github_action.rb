class GithubAction < ActiveRecord::Base
  scope :ordered, order('published_at DESC')
  validates_presence_of :github_id, :title, :permalink, :published_at, :content
  validates_uniqueness_of :github_id

  def content_html
    c = content.gsub /href\s*=\s*["']([^(http)].*?)["']/, 'href="https://github.com\1"'

    # kill the gravatar images
    c = content.gsub /<a.*?class="gravatar".*?<\/a>/, ''

    c
  end
end
