class Review < ActiveRecord::Base
validates_uniqueness_of :game_id, scope: :user_id

 belongs_to :game
 belongs_to :user
 end
