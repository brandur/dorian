require 'module_base'
require 'json_helper'

class Facts < ModuleBase
  include JsonHelper

  def update
    num_updates = 0
    json_for("#{config.http_api}/facts/latest") do |json|
      json.each do |f|
        c = f['category']
        fact = Fact.new :facts_id => f['id'], 
          :content       => f['content'], 
          :created_at    => Time.parse(f['created_at']), 
          :category_id   => c['id'], 
          :category_name => c['name'], 
          :category_slug => c['slug']
        if fact.valid?
          fact.save
          num_updates += 1
        end
      end
    end
    Slides.log :fetched, facts: num_updates
  end
end
