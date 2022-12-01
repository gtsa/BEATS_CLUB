class Profile < ApplicationRecord
  belongs_to :user
  has_many :join_communities
  has_many :communities, through: :join_communities
  has_many :genres, through: :join_genres
  validates :first_name, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true, length: { minimum: 6 }
  validates :bio, presence: true, length: { minimum: 20 }
end
