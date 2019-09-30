class AddArrayToIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :ingredients, 'text[] USING CAST(ingredients AS text[])'
    # change_column :recipes, :ingredients, :text, array: true, default: []
  end
end
