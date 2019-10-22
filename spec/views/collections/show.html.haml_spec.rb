require 'rails_helper'

describe "collections/show", type: :view do
  let(:collection) {create :collection}

  before(:each) do
    # allow(controller).to receive(:can?).and_return(true)
    assign :collection, collection
  end

  it "renders attributes in dl>dd" do
    render
    assert_select 'dl>dd', text: Time.at(collection.crt).to_s
    assert_select 'dl>dd', text: Time.at(collection.mod/1000).to_s
    assert_select 'dl>dd', text: Time.at(collection.scm/1000).to_s
    assert_select 'dl>dd', text: Time.at(collection.ls/1000).to_s
    assert_select 'dl>dd', text: Regexp.new(collection.ver.to_s)
    assert_select 'dl>dd', text: Regexp.new(collection.dty.to_s)
    assert_select 'dl>dd', text: Regexp.new(collection.usn.to_s)
    # assert_select 'dl>dd', text: Regexp.new(collection.conf.to_s)
    assert_select 'dl>dd', text: Regexp.new(collection.models.to_s)
    assert_select 'dl>dd', text: Regexp.new(collection.decks.to_s)
    # assert_select 'dl>dd', text: Regexp.new(collection.dconf.to_s)
    assert_select 'dl>dd', text: Regexp.new(collection.tags.to_s)
  end
end
