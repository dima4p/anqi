require 'rails_helper'

describe "cards/index", type: :view do
  let!(:card) {create :card}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    allow(controller).to receive(:params)
        .and_return(ActionController::Parameters.new({}))
    assign :cards, Card.all
  end

  it "renders a list of cards" do
    render

    assert_select 'tr>td.nid', text: card.nid.to_s, count: 1
    assert_select 'tr>td.did', text: card.did.to_s, count: 1
    assert_select 'tr>td.ord', text: card.ord.to_s, count: 1
    assert_select 'tr>td.mod', text: card.mod.to_s, count: 1
    assert_select 'tr>td.usn', text: card.usn.to_s, count: 1
    assert_select 'tr>td.type', text: card.type.to_s, count: 1
    assert_select 'tr>td.queue', text: card.queue.to_s, count: 1
    assert_select 'tr>td.due', text: card.due.to_s, count: 1
    assert_select 'tr>td.ivl', text: card.ivl.to_s, count: 1
    assert_select 'tr>td.factor', text: card.factor.to_s, count: 1
    assert_select 'tr>td.reps', text: card.reps.to_s, count: 1
    assert_select 'tr>td.lapses', text: card.lapses.to_s, count: 1
    assert_select 'tr>td.left', text: card.left.to_s, count: 1
    assert_select 'tr>td.odue', text: card.odue.to_s, count: 1
    assert_select 'tr>td.odid', text: card.odid.to_s, count: 1
    assert_select 'tr>td.flags', text: card.flags.to_s, count: 1
    assert_select 'tr>td.data', text: card.data.to_s, count: 1
  end

  it "renders a list of cards in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(Card, controller)
    render

    assert_select 'tr>td.nid', text: card.nid.to_s, count: 1
    assert_select 'tr>td.did', text: card.did.to_s, count: 1
    assert_select 'tr>td.ord', text: card.ord.to_s, count: 1
    assert_select 'tr>td.mod', text: card.mod.to_s, count: 1
    assert_select 'tr>td.usn', text: card.usn.to_s, count: 1
    assert_select 'tr>td.type', text: card.type.to_s, count: 1
    assert_select 'tr>td.queue', text: card.queue.to_s, count: 1
    assert_select 'tr>td.due', text: card.due.to_s, count: 1
    assert_select 'tr>td.ivl', text: card.ivl.to_s, count: 1
    assert_select 'tr>td.factor', text: card.factor.to_s, count: 1
    assert_select 'tr>td.reps', text: card.reps.to_s, count: 1
    assert_select 'tr>td.lapses', text: card.lapses.to_s, count: 1
    assert_select 'tr>td.left', text: card.left.to_s, count: 1
    assert_select 'tr>td.odue', text: card.odue.to_s, count: 1
    assert_select 'tr>td.odid', text: card.odid.to_s, count: 1
    assert_select 'tr>td.flags', text: card.flags.to_s, count: 1
    assert_select 'tr>td.data', text: card.data.to_s, count: 1
  end
end
