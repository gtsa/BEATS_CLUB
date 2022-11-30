class Profile < ApplicationRecord
  belongs_to :user
  has_many :communities, through: :join_communities
  has_many :genres, through: :join_genres
  validates :first_name, presence: true
  validates :first_name, presence: true
  # validates :nickname, presence: true
  validates :bio, presence: true
end
