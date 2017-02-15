class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.where.not(published: nil).order('published DESC').page(params[:page]).per(15)
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @recipients = @letter.recipients
  end

  def edit
  end

  # DELETE /letter_recipients/1
  # DELETE /letter_recipients/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letter_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.friendly.find(params[:id])
    end

    # def letter_params
    #   params.require(:letter).permit(
    #                               :title,
    #                               :authors,
    #                               {scans: []},
    #                               :preview,
    #                               :recieved,
    #                               :published,
    #                               :is_draft,
    #                               :content,
    #                               :letter_authors_attributes: [
    #                                 :id,
    #                                 :_destroy
    #                               ],
    #                               :letter_recipients_attributes: [
    #                                 :id,
    #                                 :_destroy
    #                               ]
    #                             )
    # end
end
