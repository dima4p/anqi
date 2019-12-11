require 'rails_helper'

describe "decks/edit", type: :view do
  let(:deck) {create :deck}
  let(:collection) {deck.collection}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:deck, deck)
    assign :collection, collection
  end

  it "renders the edit deck form" do
    render

    assert_select "form[action='#{collection_deck_path(id: deck.id, collection_id: collection.id)}'][method='post']" do
      assert_select 'input#deck_name[name=?]', 'deck[name]'
      assert_select 'input#deck_browserCollapsed[name=?]', 'deck[browserCollapsed]'
      assert_select 'input#deck_collapsed[name=?]', 'deck[collapsed]'
      assert_select 'input#deck_conf[name=?]', 'deck[conf]'
      assert_select 'input#deck_delays[name=?]', 'deck[delays]'
      assert_select 'textarea#deck_desc[name=?]', 'deck[desc]'
      assert_select 'input#deck_dyn[name=?]', 'deck[dyn]'
      assert_select 'input#deck_extendNew[name=?]', 'deck[extendNew]'
      assert_select 'input#deck_extendRev[name=?]', 'deck[extendRev]'
      assert_select 'input#deck_lrnToday[name=?]', 'deck[lrnToday]'
      assert_select 'input#deck_mid[name=?]', 'deck[mid]'
      assert_select 'input#deck_newToday[name=?]', 'deck[newToday]'
      assert_select 'input#deck_resched[name=?]', 'deck[resched]'
      assert_select 'input#deck_return[name=?]', 'deck[return]'
      assert_select 'input#deck_revToday[name=?]', 'deck[revToday]'
      assert_select 'input#deck_separate[name=?]', 'deck[separate]'
      assert_select 'input#deck_terms[name=?]', 'deck[terms]'
      assert_select 'input#deck_timeToday[name=?]', 'deck[timeToday]'
      assert_select 'input#deck_usn[name=?]', 'deck[usn]'
      assert_select 'input#deck_mod[name=?]', 'deck[mod]'
    end
  end
end
