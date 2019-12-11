# This is the main controller to process model Note
#
class NotesController < ApplicationController

  load_and_authorize_resource

  # GET /notes
  def index
    respond_to do |format|
      format.html do
        @grid = initialize_grid @notes
      end
      format.json do
        @notes = @notes.page(params[:page]) if params[:page].present?
        @notes = @notes.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /notes/1
  def show
  end

  # GET /notes/new
  def new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: t('notes.was_created') }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: t('notes.was_updated') }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: t('notes.was_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_note
  #   @note = Note.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    list = [
      :guid, :mid, :mod, :usn, :tags, :flds, :sfld, :csum, :flags, :data
    ]
    params.require(:note).permit(*list)
  end
end
