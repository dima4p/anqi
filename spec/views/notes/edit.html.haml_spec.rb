require 'rails_helper'

describe "notes/edit", type: :view do
  let(:note) {create :note}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:note, note)
  end

  it "renders the edit note form" do
    render

    assert_select "form[action='#{note_path(note)}'][method='post']" do
      assert_select 'textarea#note_guid[name=?]', 'note[guid]', count: 0
      assert_select 'input#note_mid[name=?]', 'note[mid]'
      assert_select 'input#note_mod[name=?]', 'note[mod]'
      assert_select 'input#note_usn[name=?]', 'note[usn]'
      assert_select 'textarea#note_tags[name=?]', 'note[tags]'
      assert_select 'textarea#note_flds[name=?]', 'note[flds]'
      assert_select 'input#note_sfld[name=?]', 'note[sfld]'
      assert_select 'input#note_csum[name=?]', 'note[csum]'
      assert_select 'input#note_flags[name=?]', 'note[flags]'
      assert_select 'textarea#note_data[name=?]', 'note[data]'
    end
  end
end
