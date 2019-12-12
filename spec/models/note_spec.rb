# == Schema Information
#
# Table name: notes
#
#  id    :integer          primary key
#  guid  :text             not null
#  mid   :integer          not null
#  mod   :integer          not null
#  usn   :integer          not null
#  tags  :text             not null
#  flds  :text             not null
#  sfld  :integer          not null
#  csum  :integer          not null
#  flags :integer          not null
#  data  :text             not null
#

require 'rails_helper'

describe Note, type: :model do

  subject { create :note }

  describe 'validations' do
    it { should be_valid }
    it { should validate_presence_of :guid }
    it { should validate_presence_of :mid }
    it { should validate_presence_of :mod }
    it { should validate_presence_of :usn }
    it { should validate_presence_of :tags }
    it { should validate_presence_of :flds }
    it { should validate_presence_of :sfld }
    it { should validate_presence_of :csum }
    it { should validate_presence_of :flags }
    it { should validate_presence_of :data }
  end   # validations

  describe 'class methods' do
    describe 'scopes' do
      describe '.ordered' do
        it 'orders the records of Note by :guid' do
          create :note
          create :note
          expect(Note.ordered).to eq Note.order(:guid)
        end
      end   # .ordered
    end   # scopes
  end   # class methods

end
