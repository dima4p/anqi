require 'rails_helper'

describe "collections/index", type: :view do
  let!(:collection) {create :collection_with_decks}

  before(:each) do
    # allow(controller).to receive(:can?).and_return(true)
    allow(controller).to receive(:params)
        .and_return(ActionController::Parameters.new({}))
    assign :collections, Collection.all
  end

  it "renders a list of collections" do
    render

    assert_select 'tr>td', text: Time.at(collection.crt).to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.mod/1000).to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.scm/1000).to_s, count: 1
    assert_select 'tr>td', text: collection.ver.to_s, count: 1
    assert_select 'tr>td', text: collection.dty.to_s, count: 1
    assert_select 'tr>td', text: collection.usn.to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.ls/1000).to_s, count: 1
    assert_select 'tr>td', text: collection.conf.to_s, count: 0
    assert_select 'tr>td', text: collection.models.to_s, count: 0
    assert_select 'tr>td', text: collection.decks.to_s, count: 0
    assert_select 'tr>td', text: collection.dconf.to_s, count: 0
    assert_select 'tr>td', text: collection.tags.to_s, count: 0
  end

  it "renders a list of collections in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(Collection, controller)
    render

    assert_select 'tr>td', text: Time.at(collection.crt).to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.mod/1000).to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.scm/1000).to_s, count: 1
    assert_select 'tr>td', text: collection.ver.to_s, count: 1
    assert_select 'tr>td', text: collection.dty.to_s, count: 1
    assert_select 'tr>td', text: collection.usn.to_s, count: 1
    assert_select 'tr>td', text: Time.at(collection.ls/1000).to_s, count: 1
    assert_select 'tr>td', text: collection.conf.to_s, count: 0
    assert_select 'tr>td', text: collection.models.to_s, count: 0
    assert_select 'tr>td', text: collection.decks.to_s, count: 0
    assert_select 'tr>td', text: collection.dconf.to_s, count: 0
    assert_select 'tr>td', text: collection.tags.to_s, count: 0
  end
end
