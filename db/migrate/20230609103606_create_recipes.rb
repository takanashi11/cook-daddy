class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table   :recipes do |t|
      t.string     :recipe_title,                 null: false 
      t.text       :recipe_text,                  null: false
      t.integer    :category_id,                  null: false
      t.integer    :price,                        null: false
      t.references :user,                         null: false, foreign_key: true
      t.timestamps
    end
  end
end
