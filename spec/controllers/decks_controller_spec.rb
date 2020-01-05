require 'rails_helper'

describe DecksController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Deck. As you add validations to Deck, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:deck) {create :deck}
  let(:collection) {deck.collection}

  let(:valid_attributes) do
    attributes_for(:deck).slice(*%i[name]).merge mid: collection.models.first.first
  end

  let(:invalid_attributes) do
    {name: ''}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DecksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all decks as @decks" do
      deck
      get :index, params: {collection_id: collection.id}, session: valid_session
      expect(assigns(:decks)).to be_kind_of(Array)
      expect(assigns(:decks)).to eq([deck])
    end
  end

  describe "GET #show" do
    it "assigns the requested deck as @deck" do
      get :show,
          params: {collection_id: collection.id, id: deck.to_param},
          session: valid_session
      expect(assigns(:deck)).to eq(deck)
    end
  end

  describe "GET #new" do
    it "assigns a new deck as @deck" do
      get :new, params: {collection_id: collection.id}, session: valid_session
      expect(assigns(:deck)).to be_a_new(Deck)
    end
  end

  describe "GET #edit" do
    it "assigns the requested deck as @deck" do
      get :edit, params: {collection_id: collection.id, id: deck.to_param},
          session: valid_session
      expect(assigns(:deck)).to eq(deck)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Deck" do
        expect do
          post :create,
              params: {collection_id: collection.id, deck: valid_attributes},
              session: valid_session
        end.to change(collection.decks, :size).by 0 # 1
      end

      it "assigns a newly created deck as @deck" do
        post :create,
            params: {collection_id: collection.id, deck: valid_attributes},
            session: valid_session
        expect(assigns(:deck)).to be_a(Deck)
        expect(assigns(:deck)).to be_persisted
      end

      it "redirects to the created deck" do
        post :create,
            params: {collection_id: collection.id, deck: valid_attributes},
            session: valid_session
        expect(response)
          .to redirect_to(collection_deck_url(id: collection.reload.decks.keys.last, collection_id: collection.id))
        # expect(response).to redirect_to(decks_url)
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved deck as @deck" do
        # allow_any_instance_of(Deck).to receive(:save).and_return(false)
        post :create,
            params: {collection_id: collection.id, deck: invalid_attributes},
            session: valid_session
        expect(assigns(:deck)).to be_a(Deck)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(Deck).to receive(:save).and_return(false)
        post :create,
            params: {collection_id: collection.id, deck: invalid_attributes},
            session: valid_session
        expect(response).to render_template("new")
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: 'New value'} }

      it "updates the requested deck" do
        # expect_any_instance_of(Deck)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update,
            params: {collection_id: collection.id,
                     id: deck.to_param,
                     deck: new_attributes},
            session: valid_session
        # skip("Add assertions for updated state")
        expect(deck.reload.name).to eq 'New value'
      end

      it "assigns the requested deck as @deck" do
        put :update,
            params: {collection_id: collection.id,
                     id: deck.to_param,
                     deck: valid_attributes},
            session: valid_session
        expect(assigns(:deck)).to eq(deck.reload)
      end

      it "redirects to the deck" do
        put :update,
            params: {collection_id: collection.id,
                     id: deck.to_param,
                     deck: valid_attributes},
            session: valid_session
        expect(response)
          .to redirect_to(collection_deck_url(id: deck.id, collection_id: collection.id))
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the deck as @deck" do
        # allow_any_instance_of(Deck).to receive(:update).and_return(false)
        put :update,
            params: {collection_id: collection.id,
                     id: deck.to_param,
                     deck: invalid_attributes},
            session: valid_session
        expect(assigns(:deck)).to be_a(Deck)
        # expect(assigns(:deck)).to eq(deck)
      end

      it "re-renders the 'edit' template" do
        # allow_any_instance_of(Deck).to receive(:update).and_return(false)
        put :update,
            params: {collection_id: collection.id,
                     id: deck.to_param,
                     deck: invalid_attributes},
            session: valid_session
        expect(response).to render_template("edit")
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested deck" do
      deck
      expect do
        delete :destroy,
            params: {collection_id: collection.id, id: deck.to_param},
            session: valid_session
      end.to change(collection.decks, :size).by 0 # -1
    end

    it "redirects to the decks list" do
      deck
      delete :destroy,
          params: {collection_id: collection.id, id: deck.to_param},
          session: valid_session
      expect(response).to redirect_to(collection_decks_url collection_id: collection.id)
    end
  end   # DELETE #destroy

end
