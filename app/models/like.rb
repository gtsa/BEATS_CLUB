class Like < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  validates :profile_id, uniqueness: { scope: :post_id }
end
