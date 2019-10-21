require 'rails_helper'

describe CollectionsController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Collection. As you add validations to Collection, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:collection) {create :collection}

  let(:valid_attributes) {attributes_for(:collection)
    .slice *%i[crt mod scm ver dty usn ls conf models decks dconf tags]
  }

  let(:invalid_attributes) do
    {crt: ''}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CollectionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all collections as @collections" do
      collection
      get :index, params: {}, session: valid_session
      expect(assigns(:collections)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:collections)).to eq([collection])
    end
  end

  describe "GET #show" do
    it "assigns the requested collection as @collection" do
      get :show,
          params: {id: collection.to_param},
          session: valid_session
      expect(assigns(:collection)).to eq(collection)
    end
  end

  describe "GET #new" do
    it "assigns a new collection as @collection" do
      get :new, params: {}, session: valid_session
      expect(assigns(:collection)).to be_a_new(Collection)
    end
  end

  describe "GET #edit" do
    it "assigns the requested collection as @collection" do
      get :edit, params: {id: collection.to_param},
          session: valid_session
      expect(assigns(:collection)).to eq(collection)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Collection" do
        expect do
          post :create,
              params: {collection: valid_attributes},
              session: valid_session
        end.to change(Collection, :count).by(1)
      end

      it "assigns a newly created collection as @collection" do
        post :create,
            params: {collection: valid_attributes},
            session: valid_session
        expect(assigns(:collection)).to be_a(Collection)
        expect(assigns(:collection)).to be_persisted
      end

      it "redirects to the created collection" do
        post :create,
            params: {collection: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(Collection.last)
        # expect(response).to redirect_to(collections_url)
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved collection as @collection" do
        # allow_any_instance_of(Collection).to receive(:save).and_return(false)
        post :create,
            params: {collection: invalid_attributes},
            session: valid_session
        expect(assigns(:collection)).to be_a_new(Collection)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(Collection).to receive(:save).and_return(false)
        post :create,
            params: {collection: invalid_attributes},
            session: valid_session
        expect(response).to render_template("new")
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {crt: '555'} }

      it "updates the requested collection" do
        # expect_any_instance_of(Collection)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update,
            params: {id: collection.to_param,
                     collection: new_attributes},
            session: valid_session
        collection.reload
        # skip("Add assertions for updated state")
        expect(collection.crt).to eq 555
      end

      it "assigns the requested collection as @collection" do
        put :update,
            params: {id: collection.to_param,
                     collection: valid_attributes},
            session: valid_session
        expect(assigns(:collection)).to eq(collection)
      end

      it "redirects to the collection" do
        put :update,
            params: {id: collection.to_param,
                     collection: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(collection)
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the collection as @collection" do
        # allow_any_instance_of(Collection).to receive(:update).and_return(false)
        put :update,
            params: {id: collection.to_param,
                     collection: invalid_attributes},
            session: valid_session
        expect(assigns(:collection)).to eq(collection)
      end

      it "re-renders the 'edit' template" do
        # allow_any_instance_of(Collection).to receive(:update).and_return(false)
        put :update,
            params: {id: collection.to_param,
                     collection: invalid_attributes},
            session: valid_session
        expect(response).to render_template("edit")
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested collection" do
      collection
      expect do
        delete :destroy,
            params: {id: collection.to_param},
            session: valid_session
      end.to change(Collection, :count).by(-1)
    end

    it "redirects to the collections list" do
      collection
      delete :destroy,
          params: {id: collection.to_param},
          session: valid_session
      expect(response).to redirect_to(collections_url)
    end
  end   # DELETE #destroy

end
