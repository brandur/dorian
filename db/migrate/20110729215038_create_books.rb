class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer  :goodreads_id, :null => false
      # Goodreads sometimes leaves ISBN blank
      t.string   :isbn13
      t.string   :title,        :null => false
      t.datetime :finished_at,  :null => false
      t.integer  :num_pages,    :null => false
      t.integer  :rating

      t.timestamps
    end
  end
end
