require 'rails_helper'

describe "cards/show", type: :view do
  let(:card) {create :card}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign :card, card
  end

  it "renders attributes in dl>dd" do
    render
    assert_select 'dl>dd.nid', text: Regexp.new(card.nid.to_s)
    assert_select 'dl>dd.did', text: Regexp.new(card.did.to_s)
    assert_select 'dl>dd.ord', text: Regexp.new(card.ord.to_s)
    assert_select 'dl>dd.mod', text: Regexp.new(card.mod.to_s)
    assert_select 'dl>dd.usn', text: Regexp.new(card.usn.to_s)
    assert_select 'dl>dd.type', text: Regexp.new(card.type.to_s)
    assert_select 'dl>dd.queue', text: Regexp.new(card.queue.to_s)
    assert_select 'dl>dd.due', text: Regexp.new(card.due.to_s)
    assert_select 'dl>dd.ivl', text: Regexp.new(card.ivl.to_s)
    assert_select 'dl>dd.factor', text: Regexp.new(card.factor.to_s)
    assert_select 'dl>dd.reps', text: Regexp.new(card.reps.to_s)
    assert_select 'dl>dd.lapses', text: Regexp.new(card.lapses.to_s)
    assert_select 'dl>dd.left', text: Regexp.new(card.left.to_s)
    assert_select 'dl>dd.odue', text: Regexp.new(card.odue.to_s)
    assert_select 'dl>dd.odid', text: Regexp.new(card.odid.to_s)
    assert_select 'dl>dd.flags', text: Regexp.new(card.flags.to_s)
    assert_select 'dl>dd.data', text: Regexp.new(card.data.to_s)
  end
end
