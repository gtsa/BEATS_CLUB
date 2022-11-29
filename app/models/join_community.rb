class JoinCommunity < ApplicationRecord
  belongs_to :profile
  belongs_to :community
end
