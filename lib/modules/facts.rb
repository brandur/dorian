require 'module_base'
require 'json_helper'

class Facts < ModuleBase
  include JsonHelper

  def expire
    expire_page '/'
  end

  def update
    num_updates = 0
    json_for("http://facts.brandur.org/users/#{config.user}.json?limit=100") do |json|
      facts = json['recent_facts']
      facts.map{|f| f['fact']}.each do |f|
        c = f['category']['category']
        fact = Fact.new :facts_id => f['id'], 
          :content            => f['content'], 
          :created_at         => Time.parse(f['created_at']), 
          :category_id        => c['id'], 
          :category_name      => c['name'], 
          :category_permalink => c['slug']
        if fact.valid?
          fact.save
          num_updates += 1
          expire
        end
      end
    end
    puts "Fetched #{num_updates} new fact(s)"
  end
end
