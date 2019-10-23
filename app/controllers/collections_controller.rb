# This is the main controller to process model Collection
#
class CollectionsController < ApplicationController

  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  def index
    @collections = Collection.all
    respond_to do |format|
      format.html do
        @grid = initialize_grid @collections
      end
      format.json do
        @collections = @collections.page(params[:page]) if params[:page].present?
        @collections = @collections.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /collections/1
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: t('collections.was_created') }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: t('collections.was_updated') }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: t('collections.was_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def collection_params
    list = %i[
      crt mod scm ver dty usn ls tags
    ]
    list << {conf: {}, dconf: {}, decks: {}, models: {}}
    params.require(:collection).permit(*list)
  end
end
