require_relative '../../db/config'

class Tweet < ActiveRecord::Base
	validates_uniqueness_of :tweet_id
    belongs_to :congressmen

end