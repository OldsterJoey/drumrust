class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :purchase, dependent: :destroy
  enum condition: {damaged: 0, heavily_used: 1, used: 2, like_new: 3, brand_new: 4}
  has_one_attached :picture
end
