class AddIsMentionColumnToTweets < ActiveRecord::Migration
  def change
    change_table :tweets do |t|
      t.boolean :is_mention
    end

    say_with_time "extracting is_mention" do
      Tweet.all.each do |t|
        # Allow the before_validation hook to populate the is_mention field 
        # for us
        t.save!
      end
    end
  end
end
