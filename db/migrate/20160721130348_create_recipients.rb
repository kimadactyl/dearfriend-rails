class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :description
      t.datetime :dob
      t.string :website
      t.boolean :is_living

      t.timestamps
    end
  end
end
