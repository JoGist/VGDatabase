class User < ApplicationRecord
validates :username, uniqueness: true
validates :email, uniqueness: true

has_many :reviews, dependent: :destroy
has_many :friends
has_many :mylibraries

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
        end
    end

end
