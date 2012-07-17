class AddFirstCreatedAtToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :first_created_at, :datetime
  end
end
