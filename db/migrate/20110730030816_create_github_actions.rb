class CreateGithubActions < ActiveRecord::Migration
  def change
    create_table :github_actions do |t|
      t.string   :github_id
      t.string   :title
      t.string   :permalink
      t.datetime :published_at
      t.text     :content

      t.timestamps
    end
  end
end
