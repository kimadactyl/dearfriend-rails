class AddDiedToRecipient < ActiveRecord::Migration[5.0]
  def change
    add_column :recipients, :died, :date
  end
end
