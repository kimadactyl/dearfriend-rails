class CreateLetterRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :letter_recipients do |t|
      t.references :recipient, foreign_key: true
      t.references :letter, foreign_key: true

      t.timestamps
    end
  end
end
