class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image
  validates :recipe_title,presence: true
  validates :recipe_material,presence: true
  validates :recipe_text,presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999 }
  def draw_gacha_item
    gacha_item = GachaItem.create(item_name: self.recipe_title, rarity: "Common", recipe: self)
    return gacha_item
  end
end
