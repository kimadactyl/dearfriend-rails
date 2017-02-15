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

    before_filter :default_params

    def default_params
      params[:order] ||= "created_at"
      params[:direction] ||= "desc"
    end

    def create
      @letter = Letter.new(letter_params)

      respond_to do |format|
        if @letter.save
          format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
          format.json { render :show, status: :created, location: @letter }
        else
          format.html { render :new }
          format.json { render json: @letter.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      def letter_params
        params.require(:letter).permit( :title,
                                        :preview,
                                        :recieved,
                                        :published,
                                        :is_draft,
                                        :content,
                                        {scans: []},
                                        {author_ids: []},
                                        {recipient_ids: []}
                                      )
      end
  end
end
