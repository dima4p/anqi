require 'rails_helper'

describe CardsController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Card. As you add validations to Card, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:card) {create :card}

  let(:valid_attributes) {attributes_for(:card).slice *%i[nid]}

  let(:invalid_attributes) do
    # {nid: ''}
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all cards as @cards" do
      card
      get :index, params: {}, session: valid_session
      expect(assigns(:cards)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:cards)).to eq([card])
    end
  end

  describe "GET #show" do
    it "assigns the requested card as @card" do
      get :show,
          params: {id: card.to_param},
          session: valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe "GET #new" do
    it "assigns a new card as @card" do
      get :new, params: {}, session: valid_session
      expect(assigns(:card)).to be_a_new(Card)
    end
  end

  describe "GET #edit" do
    it "assigns the requested card as @card" do
      get :edit, params: {id: card.to_param},
          session: valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Card" do
        expect do
          post :create,
              params: {card: valid_attributes},
              session: valid_session
        end.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create,
            params: {card: valid_attributes},
            session: valid_session
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end

      it "redirects to the created card" do
        post :create,
            params: {card: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(Card.last)
        # expect(response).to redirect_to(cards_url)
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        # allow_any_instance_of(Card).to receive(:save).and_return(false)
        post :create,
            params: {card: invalid_attributes},
            session: valid_session
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(Card).to receive(:save).and_return(false)
        post :create,
            params: {card: invalid_attributes},
            session: valid_session
        expect(response).to render_template("new")
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {nid: 'New value'} }

      it "updates the requested card" do
        # expect_any_instance_of(Card)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update,
            params: {id: card.to_param,
                     card: new_attributes},
            session: valid_session
        card.reload
        # skip("Add assertions for updated state")
        expect(card.nid).to eq 'New value'
      end

      it "assigns the requested card as @card" do
        put :update,
            params: {id: card.to_param,
                     card: valid_attributes},
            session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it "redirects to the card" do
        put :update,
            params: {id: card.to_param,
                     card: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(card)
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the card as @card" do
        # allow_any_instance_of(Card).to receive(:update).and_return(false)
        put :update,
            params: {id: card.to_param,
                     card: invalid_attributes},
            session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it "re-renders the 'edit' template" do
        # allow_any_instance_of(Card).to receive(:update).and_return(false)
        put :update,
            params: {id: card.to_param,
                     card: invalid_attributes},
            session: valid_session
        expect(response).to render_template("edit")
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested card" do
      card
      expect do
        delete :destroy,
            params: {id: card.to_param},
            session: valid_session
      end.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card
      delete :destroy,
          params: {id: card.to_param},
          session: valid_session
      expect(response).to redirect_to(cards_url)
    end
  end   # DELETE #destroy

end
