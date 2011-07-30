require 'module_base'
require 'xml_helper'

class Goodreads < ModuleBase
  include XmlHelper

  def update
    num_updates = 0
    uri = "http://www.goodreads.com/review/list/#{config.user_id}.xml?v=2&per_page=200&shelf=read&sort=date_read&key=#{config.key}"
    xml_for(uri, '//reviews/review') do |r|
      book = Book.new :goodreads_id => r.find('book/id').first.content, 
        :isbn13      => r.find('book/isbn13').first.content, 
        :title       => r.find('book/title').first.content.strip, 
        :finished_at => Time.parse(r.find('read_at').first.content), 
        :num_pages   => r.find('book/num_pages').first.content, 
        :rating      => r.find('rating').first.content
      r.find('book/authors/author').each do |a|
        book.add_author(a.find('name').first.content.strip)
      end
      if book.valid?
        book.save
        num_updates += 1
        expire
      end
    end
    puts "Fetched #{num_updates} new book(s)"
  end

private

  def expire
    expire_page '/'
  end
end
