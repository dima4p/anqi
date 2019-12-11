require 'rails_helper'

describe Note, type: :model do

  subject { create :note }

  describe 'validations' do
    it { should be_valid }
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
