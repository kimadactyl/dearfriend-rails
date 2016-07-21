class LetterAuthorsController < ApplicationController
  before_action :set_letter_author, only: [:show, :edit, :update, :destroy]

  # GET /letter_authors
  # GET /letter_authors.json
  def index
    @letter_authors = LetterAuthor.all
  end

  # GET /letter_authors/1
  # GET /letter_authors/1.json
  def show
  end

  # GET /letter_authors/new
  def new
    @letter_author = LetterAuthor.new
  end

  # GET /letter_authors/1/edit
  def edit
  end

  # POST /letter_authors
  # POST /letter_authors.json
  def create
    @letter_author = LetterAuthor.new(letter_author_params)

    respond_to do |format|
      if @letter_author.save
        format.html { redirect_to @letter_author, notice: 'Letter author was successfully created.' }
        format.json { render :show, status: :created, location: @letter_author }
      else
        format.html { render :new }
        format.json { render json: @letter_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_authors/1
  # PATCH/PUT /letter_authors/1.json
  def update
    respond_to do |format|
      if @letter_author.update(letter_author_params)
        format.html { redirect_to @letter_author, notice: 'Letter author was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter_author }
      else
        format.html { render :edit }
        format.json { render json: @letter_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_authors/1
  # DELETE /letter_authors/1.json
  def destroy
    @letter_author.destroy
    respond_to do |format|
      format.html { redirect_to letter_authors_url, notice: 'Letter author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_author
      @letter_author = LetterAuthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_author_params
      params.require(:letter_author).permit(:author_id, :letter_id)
    end
end
