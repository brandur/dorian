class Tweet < ActiveRecord::Base
  default_scope :order => 'published_at DESC'
  validates_presence_of :content, :permalink, :published_at
  validates_uniqueness_of :permalink

  def content_html
    html = content
    # links like protocol://link
    html = html.gsub /(^|[\n ])([\w]+?:\/\/[\w]+[^ "\n\r\t< ]*)/, '\1<a href="\2" rel="nofollow">\2</a>'
    # links like www.link.com or ftp.link.com
    html = html.gsub /(^|[\n ])((www|ftp)\.[^ "\t\n\r< ]*)/, '\1<a href="http://\2" rel="nofollow">\2</a>'
    # user links (like @fyrerise)
    html = html.gsub /@(\w+)/, '<a href="http://www.twitter.com/\1" rel="nofollow">@\1</a>'
    # hash tag search (like #mix11)
    html = html.gsub /#(\w+)/, '<a href="http://search.twitter.com/search?q=\1" rel="nofollow">#\1</a>'
  end
end
