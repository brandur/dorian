class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.string :book_id
      t.string :name

      t.timestamps
    end
  end
end
