ActiveAdmin.register Recipient do

  permit_params :first_name, :last_name, :born, :died, :description, :website

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


end
