require 'rails_helper'

describe NotesController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Note. As you add validations to Note, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:note) {create :note}

  let(:valid_attributes) {attributes_for(:note).slice *%w[guid].map(&:to_sym)}

  let(:invalid_attributes) do
    # {guid: ''}
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NotesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all notes as @notes" do
      note
      get :index, params: {}, session: valid_session
      expect(assigns(:notes)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:notes)).to eq([note])
    end
  end

  describe "GET #show" do
    it "assigns the requested note as @note" do
      get :show,
          params: {id: note.to_param},
          session: valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "GET #new" do
    it "assigns a new note as @note" do
      get :new, params: {}, session: valid_session
      expect(assigns(:note)).to be_a_new(Note)
    end
  end

  describe "GET #edit" do
    it "assigns the requested note as @note" do
      get :edit, params: {id: note.to_param},
          session: valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Note" do
        expect do
          post :create,
              params: {note: valid_attributes},
              session: valid_session
        end.to change(Note, :count).by(1)
      end

      it "assigns a newly created note as @note" do
        post :create,
            params: {note: valid_attributes},
            session: valid_session
        expect(assigns(:note)).to be_a(Note)
        expect(assigns(:note)).to be_persisted
      end

      it "redirects to the created note" do
        post :create,
            params: {note: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(Note.last)
        # expect(response).to redirect_to(notes_url)
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved note as @note" do
        # allow_any_instance_of(Note).to receive(:save).and_return(false)
        post :create,
            params: {note: invalid_attributes},
            session: valid_session
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(Note).to receive(:save).and_return(false)
        post :create,
            params: {note: invalid_attributes},
            session: valid_session
        expect(response).to render_template("new")
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {guid: 'New value'} }

      it "updates the requested note" do
        # expect_any_instance_of(Note)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update,
            params: {id: note.to_param,
                     note: new_attributes},
            session: valid_session
        note.reload
        # skip("Add assertions for updated state")
        expect(note.guid).to eq 'New value'
      end

      it "assigns the requested note as @note" do
        put :update,
            params: {id: note.to_param,
                     note: valid_attributes},
            session: valid_session
        expect(assigns(:note)).to eq(note)
      end

      it "redirects to the note" do
        put :update,
            params: {id: note.to_param,
                     note: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(note)
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the note as @note" do
        # allow_any_instance_of(Note).to receive(:update).and_return(false)
        put :update,
            params: {id: note.to_param,
                     note: invalid_attributes},
            session: valid_session
        expect(assigns(:note)).to eq(note)
      end

      it "re-renders the 'edit' template" do
        # allow_any_instance_of(Note).to receive(:update).and_return(false)
        put :update,
            params: {id: note.to_param,
                     note: invalid_attributes},
            session: valid_session
        expect(response).to render_template("edit")
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested note" do
      note
      expect do
        delete :destroy,
            params: {id: note.to_param},
            session: valid_session
      end.to change(Note, :count).by(-1)
    end

    it "redirects to the notes list" do
      note
      delete :destroy,
          params: {id: note.to_param},
          session: valid_session
      expect(response).to redirect_to(notes_url)
    end
  end   # DELETE #destroy

end
