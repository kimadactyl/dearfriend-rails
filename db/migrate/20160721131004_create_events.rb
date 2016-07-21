class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :finish
      t.string :title
      t.text :description
      t.string :street1
      t.string :street2
      t.string :city
      t.string :postcode
      t.string :eventbrite
      t.string :facebook

      t.timestamps
    end
  end
end
