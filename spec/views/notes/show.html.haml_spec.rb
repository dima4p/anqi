require 'rails_helper'

describe "notes/show", type: :view do
  let(:note) {create :note}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign :note, note
  end

  it "renders attributes in dl>dd" do
    render
    assert_select 'dl>dd.guid', text: note.guid.to_s
    assert_select 'dl>dd.mid', text: Regexp.new(note.mid.to_s)
    assert_select 'dl>dd.mod', text: Time.at(note.mod).to_s
    assert_select 'dl>dd.usn', text: Regexp.new(note.usn.to_s)
    assert_select 'dl>dd.tags', text: Regexp.new(note.tags.to_s)
    assert_select 'dl>dd.field', text: Regexp.new(note.fields.first.to_s)
    assert_select 'dl>dd.sfld', text: Regexp.new(note.sfld.to_s), count: 0
    assert_select 'dl>dd.csum', text: Regexp.new(note.csum.to_s)
    assert_select 'dl>dd.flags', text: Regexp.new(note.flags.to_s)
    assert_select 'dl>dd.data', text: Regexp.new(note.data.to_s)
  end
end
