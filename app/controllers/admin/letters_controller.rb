module Admin
  class LettersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Letter.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Letter.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    # Override to allow multiple image uploads
    # def create
    #   letter = params[:letter]
    #   scans = letter[:scans]
    #
    #   success = true
    #   scans.each do |img|
    #     resource = resource_class.new(scans: img, letter: letter)
    #     success &&= resource.save
    #   end
    #
    #   if success
    #     redirect_to(
    #       admin_letters_path,
    #       notice: translate_with_resource("create.success"),
    #     )
    #   else
    #     render :new, locals: {
    #       page: Administrate::Page::Form.new(dashboard, resource),
    #     }
    #   end
    # end

  end
end
