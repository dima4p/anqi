require 'rails_helper'

describe "notes/index", type: :view do
  let!(:note) {create :note}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    allow(controller).to receive(:params)
        .and_return(ActionController::Parameters.new({}))
    assign :notes, Note.all
  end

  it "renders a list of notes" do
    render

    assert_select 'tr>td.guid', text: note.guid.to_s, count: 1
    assert_select 'tr>td.mid', text: note.mid.to_s, count: 1
    assert_select 'tr>td.mod', text: note.mod.to_s, count: 1
    assert_select 'tr>td.usn', text: note.usn.to_s, count: 1
    assert_select 'tr>td.tags', text: note.tags.to_s, count: 1
    assert_select 'tr>td.flds', text: note.flds.to_s, count: 1
    assert_select 'tr>td.sfld', text: note.sfld.to_s, count: 1
    assert_select 'tr>td.csum', text: note.csum.to_s, count: 1
    assert_select 'tr>td.flags', text: note.flags.to_s, count: 1
    assert_select 'tr>td.data', text: note.data.to_s, count: 1
  end

  it "renders a list of notes in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(Note, controller)
    render

    assert_select 'tr>td.guid', text: note.guid.to_s, count: 1
    assert_select 'tr>td.mid', text: note.mid.to_s, count: 1
    assert_select 'tr>td.mod', text: note.mod.to_s, count: 1
    assert_select 'tr>td.usn', text: note.usn.to_s, count: 1
    assert_select 'tr>td.tags', text: note.tags.to_s, count: 1
    assert_select 'tr>td.flds', text: note.flds.to_s, count: 1
    assert_select 'tr>td.sfld', text: note.sfld.to_s, count: 1
    assert_select 'tr>td.csum', text: note.csum.to_s, count: 1
    assert_select 'tr>td.flags', text: note.flags.to_s, count: 1
    assert_select 'tr>td.data', text: note.data.to_s, count: 1
  end
end
