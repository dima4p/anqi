require 'rails_helper'

describe "decks/show", type: :view do
  let(:deck) {create :deck}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign :deck, deck
    assign :collection_id, deck.collection.id
  end

  it "renders attributes in dl>dd" do
    render
    assert_select 'dl>dd', text: Regexp.new(deck.name.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.browserCollapsed.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.collapsed.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.conf.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.delays.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.desc.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.dyn.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.extendNew.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.extendRev.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.lrnToday.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.mid.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.newToday.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.resched.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.return.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.revToday.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.separate.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.terms.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.timeToday.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.usn.to_s)
    assert_select 'dl>dd', text: Regexp.new(deck.mod.to_s)
    assert_select 'dl>dd.notes_count', text: Regexp.new(deck.notes_count.to_s)
  end
end
