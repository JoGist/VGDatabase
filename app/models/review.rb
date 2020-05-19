class Review < ActiveRecord::Base
validates_uniqueness_of :game_id, scope: :user_id

 belongs_to :games, optional:true
 belongs_to :users, optional:true
 end
