class Genre < ApplicationRecord
  has_many :communities
  has_many :profiles, through: :join_genres
  validates :name, uniqueness: { case_sensitive: false }
end
