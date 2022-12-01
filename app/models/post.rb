class Post < ApplicationRecord
  has_many :profiles, through: :likes
  belongs_to :community
  validates :content, length: { minimum: 1, maximum: 250 }
end
