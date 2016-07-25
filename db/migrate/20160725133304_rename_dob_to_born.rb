class RenameDobToBorn < ActiveRecord::Migration[5.0]
  def change
      rename_column :recipients, :dob, :born
  end
end
