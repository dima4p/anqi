require "rails_helper"

RSpec.describe DecksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/collections/1/decks").to route_to("decks#index", collection_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/collections/1/decks/new").to route_to("decks#new", collection_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/collections/1/decks/2").to route_to("decks#show", collection_id: "1", :id => "2")
    end

    it "routes to #edit" do
      expect(:get => "/collections/1/decks/2/edit").to route_to("decks#edit", collection_id: "1", :id => "2")
    end


    it "routes to #create" do
      expect(:post => "/collections/1/decks").to route_to("decks#create", collection_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/collections/1/decks/2").to route_to("decks#update", collection_id: "1", :id => "2")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/collections/1/decks/2").to route_to("decks#update", collection_id: "1", :id => "2")
    end

    it "routes to #destroy" do
      expect(:delete => "/collections/1/decks/2").to route_to("decks#destroy", collection_id: "1", :id => "2")
    end
  end
end
