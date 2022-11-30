class JoinCommunity < ApplicationRecord
  belongs_to :profile
  belongs_to :community
  validates :profile_id, uniqueness: { scope: :community_id }
end
