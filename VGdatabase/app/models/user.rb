class User < ApplicationRecord
has_many :reviews, dependent: :destroy
has_many :friends
end
