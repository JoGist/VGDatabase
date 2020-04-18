class User < ApplicationRecord
has_many :reviews
has_many :friends
belongs_to :friends
end
