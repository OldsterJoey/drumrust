class Product < ApplicationRecord
  belongs_to :category
  enum condition: {damaged: 0, heavilyused: 1, used: 2, likenew: 3, brandnew: 4}
end
