require 'rails_helper'

describe "decks/index", type: :view do
  let!(:deck) {create :deck}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    allow(controller).to receive(:params)
        .and_return(ActionController::Parameters.new({}))
    assign :decks, Deck.all
    assign :collection, deck.collection
  end

  it "renders a list of decks" do
    render

    assert_select 'tr>td.name', text: deck.name.to_s, count: 1
    assert_select 'tr>td.browserCollapsed', text: deck.browserCollapsed.to_s, count: 0
    assert_select 'tr>td.collapsed', text: deck.collapsed.to_s, count: 0
    assert_select 'tr>td.conf', text: deck.conf.to_s, count: 0
    assert_select 'tr>td.delays', text: deck.delays.to_s, count: 0
    assert_select 'tr>td.desc', text: deck.desc.to_s, count: 0
    assert_select 'tr>td.dyn', text: deck.dyn.to_s, count: 0
    assert_select 'tr>td.extendNew', text: deck.extendNew.to_s, count: 1
    assert_select 'tr>td.extendRev', text: deck.extendRev.to_s, count: 1
    assert_select 'tr>td.lrnToday', text: deck.lrnToday.to_s, count: 1
    assert_select 'tr>td.mid', text: deck.mid.to_s, count: 1
    assert_select 'tr>td.newToday', text: deck.newToday.to_s, count: 1
    assert_select 'tr>td.resched', text: deck.resched.to_s, count: 0
    assert_select 'tr>td.return', text: deck.return.to_s, count: 0
    assert_select 'tr>td.revToday', text: deck.revToday.to_s, count: 1
    assert_select 'tr>td.separate', text: deck.separate.to_s, count: 0
    assert_select 'tr>td.terms', text: deck.terms.to_s, count: 0
    assert_select 'tr>td.timeToday', text: deck.timeToday.to_s, count: 1
    assert_select 'tr>td.usn', text: deck.usn.to_s, count: 1
    assert_select 'tr>td.mod', text: deck.mod.to_s, count: 1
    assert_select 'tr>td.notes_count', text: deck.notes_count.to_s, count: 1
  end
end
