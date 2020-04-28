class Mylibrary < ApplicationRecord
belongs_to :games, optional:true
belongs_to :users, optional:true
end
