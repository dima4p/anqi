require 'rails_helper'

describe "Collections", type: :request do
  before :each do
    allow_any_instance_of(CollectionsController).to receive(:current_user).and_return(current_user)
  end

  describe "GET /collections" do
    it "works! (now write some real specs)" do
      get collections_path
      # expect(response).to have_http_status(200)
    end
  end
end
