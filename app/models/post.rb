class Post < ApplicationRecord
  belongs_to :community
  validates :content, length: { minimum: 1, maximum: 250 }
end
