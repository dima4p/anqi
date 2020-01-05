# This is the main controller to process model Deck
#
class DecksController < ApplicationController

  before_action :set_collection
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  # GET /decks
  def index
    @decks = Deck.all(@collection_id)
    respond_to do |format|
      format.html do
        # @grid = initialize_grid @decks
      end
      format.json do
        @decks = @decks.page(params[:page]) if params[:page].present?
        @decks = @decks.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /decks/1
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  def create
    @deck = Deck.new(deck_params.merge collection_id: @collection_id)
    respond_to do |format|
      if @deck.save
        format.html do
          redirect_to collection_deck_url(id: @deck.id, collection_id: @collection.id),
              notice: t('decks.was_updated')
        end
        format.json { render :show, status: :created, location: @deck }
      else
        logger.info "DecksController@#{__LINE__}#create #{@deck.errors.messages}"
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html do
          redirect_to collection_deck_url(id: @deck.id, collection_id: @collection.id),
              notice: t('decks.was_updated')
        end
        format.json { render :show, status: :ok, location: @deck }
      else
        logger.info "DecksController@#{__LINE__}#update #{@deck.errors.messages}"
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  def destroy
    # @deck.destroy
    respond_to do |format|
      format.html do
        redirect_to collection_decks_url(collection_id: @collection.id),
            notice: t('decks.was_deleted')
      end
      format.json { head :no_content }
    end
  end

  private

  def set_collection
    @collection_id = params[:collection_id] || 1
    @collection = Collection.find @collection_id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deck_params
    list = [
      :name, :browserCollapsed, :collapsed, :conf, :delays, :desc, :dyn, :extendNew, :extendRev, :lrnToday, :mid, :newToday, :resched, :return, :revToday, :separate, :terms, :timeToday, :usn, :mod
    ]
    params.require(:deck).permit(*list)
  end
end
