class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  enum condition: {damaged: 0, heavilyused: 1, used: 2, likenew: 3, brandnew: 4}
  has_one_attached :picture
end
