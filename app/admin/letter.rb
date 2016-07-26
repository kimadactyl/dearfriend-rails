ActiveAdmin.register Letter do

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

  controller do
    def permitted_params
      params.permit! # allow all parameters
    end
  end

  index do |letter|
    selectable_column
    column :id
    column "Authors" do |letter|
      letter.authors.map { |author| author.name }.join(", ")
    end
    column "Recipients" do |letter|
      letter.recipients.map { |recipient| recipient.name }.join(", ")
    end
    column :recieved
    column :published
    column "Preview" do |letter|
      image_tag(letter.preview.url(:thumb))
    end
    actions
  end

   show do
     panel "Authors" do
       table_for letter.authors do
         column "name" do |author|
           author.name
         end
       end
     end

     attributes_table do
       row :recieved
       row :published
       row :content
       row :preview do
         image_tag(letter.preview.url(:thumb))
       end
       row :scans do
         ul do
         letter.scans.each do |scan|
           li do
             image_tag(scan.url(:thumb))
           end
         end
       end
       end
     end

   end

  form(:html => { :multipart => true })  do |f|
    f.inputs "Letters" do # physician's fields
      f.has_many :letter_authors do |author|
        author.input :author, :collection => Author.all.order(:last_name).map{ |author|  [author.last_first, author.id] }
      end
      f.has_many :letter_recipients do |recipient|
        recipient.input :recipient, :collection => Recipient.all.order(:last_name).map{ |recipient|  [recipient.last_first, recipient.id] }
      end
      f.input :recieved
      f.input :published
      f.input :content
      f.input :is_draft
      f.input :preview
      f.input :scans, as: :file, input_html: { multiple: true }
      f.actions
    end
  end



end
