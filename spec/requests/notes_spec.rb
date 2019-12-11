require 'rails_helper'

describe "Notes", type: :request do
  before :each do
    allow_any_instance_of(NotesController).to receive(:current_user).and_return(current_user)
  end

  describe "GET /notes" do
    it "works! (now write some real specs)" do
      get notes_path
      # expect(response).to have_http_status(200)
    end
  end
end
