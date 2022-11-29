class JoinGenre < ApplicationRecord
  belongs_to :profile
  belongs_to :genre
end
