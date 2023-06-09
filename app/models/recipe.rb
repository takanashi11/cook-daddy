class Recipe < ApplicationRecord
  belongs_to :user
  validates :recipe_title,presence: true
  validates :recipe_text,presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999 }
end
