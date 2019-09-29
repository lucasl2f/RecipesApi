class Recipe < ApplicationRecord
  enum category: [ :starter, :salad, :main_dish, :dessert, :beverage, :drink ]
  validates :name, :ingredients, presence: true
end
