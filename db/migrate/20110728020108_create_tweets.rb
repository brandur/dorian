class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :permalink
      t.datetime :published_at

      t.timestamps
    end
  end
end
