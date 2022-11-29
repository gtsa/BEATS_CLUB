class Community < ApplicationRecord
  belongs_to :genre
  belongs_to :profile
end
