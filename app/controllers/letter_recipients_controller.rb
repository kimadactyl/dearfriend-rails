class LetterRecipientsController < ApplicationController
  before_action :set_letter_recipient, only: [:show, :edit, :update, :destroy]

  # GET /letter_recipients
  # GET /letter_recipients.json
  def index
    @letter_recipients = LetterRecipient.all
  end

  # GET /letter_recipients/1
  # GET /letter_recipients/1.json
  def show
  end

  # GET /letter_recipients/new
  def new
    @letter_recipient = LetterRecipient.new
  end

  # GET /letter_recipients/1/edit
  def edit
  end

  # POST /letter_recipients
  # POST /letter_recipients.json
  def create
    @letter_recipient = LetterRecipient.new(letter_recipient_params)

    respond_to do |format|
      if @letter_recipient.save
        format.html { redirect_to @letter_recipient, notice: 'Letter recipient was successfully created.' }
        format.json { render :show, status: :created, location: @letter_recipient }
      else
        format.html { render :new }
        format.json { render json: @letter_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_recipients/1
  # PATCH/PUT /letter_recipients/1.json
  def update
    respond_to do |format|
      if @letter_recipient.update(letter_recipient_params)
        format.html { redirect_to @letter_recipient, notice: 'Letter recipient was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter_recipient }
      else
        format.html { render :edit }
        format.json { render json: @letter_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_recipients/1
  # DELETE /letter_recipients/1.json
  def destroy
    @letter_recipient.destroy
    respond_to do |format|
      format.html { redirect_to letter_recipients_url, notice: 'Letter recipient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_recipient
      @letter_recipient = LetterRecipient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_recipient_params
      params.require(:letter_recipient).permit(:recipient_id, :letter_id)
    end
end
