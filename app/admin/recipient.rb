ActiveAdmin.register Recipient do

  permit_params :first_name, :last_name, :born, :died, :description, :website

  config.sort_order = 'last_name_asc'

  index do
    id_column
    column :last_name
    column :first_name
    column :born
    column :died
    column :website
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Recipient" do
      f.input :first_name
      f.input :last_name
      f.input :born, as: :date_picker, :maxlength => 20
      f.input :died, as: :date_picker
      f.input :description, as: :text, :input_html => { :class => 'autogrow', :rows => 5 }
      f.input :website
    end
    f.actions
  end

  show do
    attributes_table do
      row :last_name
      row :first_name
      row :born
      row :died
      row :website
      row :created_at
      row :updated_at
    end
    panel "Letters to this author" do
      table_for recipient.letters do
        column do |letter|
          link_to letter.authors_pp.html_safe, admin_letter_path(letter)
        end
      end
    end
  end

end
