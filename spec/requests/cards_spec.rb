require 'rails_helper'

describe "Cards", type: :request do
  before :each do
    allow_any_instance_of(CardsController).to receive(:current_user).and_return(current_user)
  end

  describe "GET /cards" do
    it "works! (now write some real specs)" do
      get cards_path
      # expect(response).to have_http_status(200)
    end
  end
end
