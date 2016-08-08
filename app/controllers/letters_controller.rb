class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.where.not(published: nil).paginate(:page => params[:page], :per_page => 15).order('published DESC')
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @recipients = @letter.recipients
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.friendly.find(params[:id])
    end
end
