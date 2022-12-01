class Community < ApplicationRecord
  belongs_to :genre
  has_many :profiles, through: :join_communities
  has_many :posts
  validates :name, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 25 }
end
