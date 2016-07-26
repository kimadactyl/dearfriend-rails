class ChangeBornToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :recipients, :born, :date
  end
end
