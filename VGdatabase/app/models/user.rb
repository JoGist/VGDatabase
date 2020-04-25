class User < ApplicationRecord
has_many :reviews, dependent: :destroy
has_and_belongs_to_many :friends
has_many :mylibraries
end
