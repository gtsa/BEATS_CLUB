class JoinGenre < ApplicationRecord
  belongs_to :profile
  belongs_to :genre
  validates profile_id, uniqueness: { scope: :genre_id }
end
