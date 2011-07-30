class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.integer  :facts_id
      t.text     :content
      t.datetime :created_at
      t.integer  :category_id
      t.string   :category_name
      t.string   :category_permalink

      t.timestamps
    end
  end
end
