class CreateLetterAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :letter_authors do |t|
      t.references :author, foreign_key: true
      t.references :letter, foreign_key: true

      t.timestamps
    end
  end
end
