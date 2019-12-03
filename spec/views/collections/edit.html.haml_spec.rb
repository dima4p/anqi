require 'rails_helper'

describe "collections/edit", type: :view do
  let(:collection) {create :collection}

  before(:each) do
    # allow(controller).to receive(:can?).and_return(true)
    assign(:collection, collection)
  end

  it "renders the edit collection form" do
    render

    assert_select "form[action='#{collection_path(collection)}'][method='post']" do
      assert_select 'input#collection_crt[name=?]', 'collection[crt]'
      assert_select 'input#collection_mod[name=?]', 'collection[mod]'
      assert_select 'input#collection_scm[name=?]', 'collection[scm]'
      assert_select 'input#collection_ver[name=?]', 'collection[ver]'
      assert_select 'input#collection_dty[name=?]', 'collection[dty]'
      assert_select 'input#collection_usn[name=?]', 'collection[usn]'
      assert_select 'input#collection_ls[name=?]', 'collection[ls]'
      assert_select 'textarea#collection_conf[name=?]', 'collection[conf]'
      assert_select 'textarea#collection_models[name=?]', 'collection[models]'
      assert_select 'textarea#collection_decks[name=?]', 'collection[decks]', count: 0
      assert_select 'textarea#collection_dconf[name=?]', 'collection[dconf]'
      assert_select 'textarea#collection_tags[name=?]', 'collection[tags]'
    end
  end
end
