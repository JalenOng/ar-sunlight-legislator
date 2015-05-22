require_relative '../../db/config'

class Tweet < ActiveRecord::Base
	validates_uniqueness_of :text
    belongs_to :congressmen
    attr_accessor :twitter_id

end