require_relative '../config'

class CreateTweet < ActiveRecord::Migration

  def change
      create_table :tweets do |c|
      c.string :twitter_id
      c.string :tweet_id
      c.string :text
    end
  end

end