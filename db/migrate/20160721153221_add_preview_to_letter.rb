class AddPreviewToLetter < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :preview, :string
  end
end
