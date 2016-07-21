class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.datetime :recieved
      t.datetime :published
      t.boolean :is_draft
      t.text :content

      t.timestamps
    end
  end
end
