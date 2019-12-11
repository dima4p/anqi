require 'rails_helper'

describe "Decks", type: :request do
  before :each do
    allow_any_instance_of(DecksController).to receive(:current_user).and_return(current_user)
  end

  describe "GET /collections/1/decks" do
    it "works! (now write some real specs)" do
      collection = create :collection
      get collection_decks_path collection_id: collection.id
      # expect(response).to have_http_status(200)
    end
  end
end
