class Profile < ApplicationRecord
  belongs_to :user
  has_many :communities, through: :join_communities
  has_many :genres, through: :join_genres
  has_many :posts, through: :likes
  validates :first_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :bio, presence: true
end
