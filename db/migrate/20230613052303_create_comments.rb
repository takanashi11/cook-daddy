class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string     :comment_text, null: false
      t.references :user,         null: false, foreign_key: true
      t.references :recipe,       null: false, foreign_key: { to_table: :recipes, on_delete: :cascade }
      t.timestamps
    end
  end
end
