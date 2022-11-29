class Community < ApplicationRecord
  belongs_to :genre
  has_many :profiles, through: :join_communities
  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 25 }
end
