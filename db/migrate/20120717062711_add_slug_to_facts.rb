class AddSlugToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :category_slug, :string
    remove_column :facts, :category_permalink
  end
end
