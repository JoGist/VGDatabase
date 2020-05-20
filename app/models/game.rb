class Game < ApplicationRecord
validates :title, uniqueness: true
validates :serial, uniqueness: true

has_one :review
has_many :mylibraries
end
