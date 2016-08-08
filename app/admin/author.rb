ActiveAdmin.register Author do

  permit_params :first_name, :last_name, :twitter, :email

  config.sort_order = 'last_name_asc'

  index do
    id_column
    column :last_name
    column :first_name
    column :email
    column :twitter
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :last_name
      row :first_name
      row :email
      row :twitter
      row :created_at
      row :updated_at
    end
    panel "Letters by this author" do
      table_for author.letters do
        column do |letter|
          link_to letter.recipients_pp.html_safe, admin_letter_path(letter)
        end
      end
    end
  end
end
