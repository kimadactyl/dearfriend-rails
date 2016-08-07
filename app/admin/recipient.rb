ActiveAdmin.register Recipient do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

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
