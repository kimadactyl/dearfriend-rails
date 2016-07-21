class AddScansToLetters < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :scans, :json
  end
end
