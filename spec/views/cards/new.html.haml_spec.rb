require 'rails_helper'

describe "cards/new", type: :view do
  let(:card) {build :card}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:card, card)
  end

  it "renders new card form" do
    render

    assert_select "form[action='#{cards_path}'][method='post']" do
      assert_select 'input#card_nid[name=?]', 'card[nid]'
      assert_select 'input#card_did[name=?]', 'card[did]'
      assert_select 'input#card_ord[name=?]', 'card[ord]'
      assert_select 'input#card_mod[name=?]', 'card[mod]'
      assert_select 'input#card_usn[name=?]', 'card[usn]'
      assert_select 'input#card_type[name=?]', 'card[type]'
      assert_select 'input#card_queue[name=?]', 'card[queue]'
      assert_select 'input#card_due[name=?]', 'card[due]'
      assert_select 'input#card_ivl[name=?]', 'card[ivl]'
      assert_select 'input#card_factor[name=?]', 'card[factor]'
      assert_select 'input#card_reps[name=?]', 'card[reps]'
      assert_select 'input#card_lapses[name=?]', 'card[lapses]'
      assert_select 'input#card_left[name=?]', 'card[left]'
      assert_select 'input#card_odue[name=?]', 'card[odue]'
      assert_select 'input#card_odid[name=?]', 'card[odid]'
      assert_select 'input#card_flags[name=?]', 'card[flags]'
      assert_select 'textarea#card_data[name=?]', 'card[data]'
    end
  end
end
