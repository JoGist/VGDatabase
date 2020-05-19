class Game < ApplicationRecord
validates :title, uniqueness: true
validates :serial, uniqueness: true

has_many :reviews
has_many :mylibraries
end
