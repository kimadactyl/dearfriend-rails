class RemoveIsLivingFromRecipients < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipients, :is_living
  end
end
