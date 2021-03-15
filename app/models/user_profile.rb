class UserProfile < ApplicationRecord
  belongs_to :user
  has_one :address_id
end
