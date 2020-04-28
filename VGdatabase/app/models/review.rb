class Review < ActiveRecord::Base
 belongs_to :games, optional:true
 belongs_to :users, optional:true
 end
