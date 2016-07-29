class AddSlugToLetters < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :slug, :string
    add_index :letters, :slug, unique: true
  end
end
