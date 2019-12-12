# This is the main controller to process model Card
#
class CardsController < ApplicationController

  load_and_authorize_resource

  # GET /cards
  def index
    respond_to do |format|
      format.html do
        @grid = initialize_grid @cards
      end
      format.json do
        @cards = @cards.page(params[:page]) if params[:page].present?
        @cards = @cards.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /cards/1
  def show
  end

  # GET /cards/new
  def new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  def create
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: t('cards.was_created') }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: t('cards.was_updated') }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: t('cards.was_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_card
  #   @card = Card.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    list = [
      :nid, :did, :ord, :mod, :usn, :type, :queue, :due, :ivl, :factor, :reps, :lapses, :left, :odue, :odid, :flags, :data
    ]
    params.require(:card).permit(*list)
  end
end
