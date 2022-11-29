class Genre < ApplicationRecord
  has_many :communities
  has_many :profiles, through: :join_genres
end
