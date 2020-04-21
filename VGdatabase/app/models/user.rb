class User < ApplicationRecord
has_many :reviews, dependent: :destroy
has_many :friends
has_many :mylibraries
end
