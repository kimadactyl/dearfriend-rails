class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.where.not(published: nil)
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @recipients = @letter.recipients
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end
end
