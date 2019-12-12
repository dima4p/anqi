require 'rails_helper'

describe Card, type: :model do

  subject(:card) { create :card }

  describe 'validations' do
    it { should be_valid }
  end   # validations

  describe 'class methods' do
    describe 'scopes' do
      describe '.ordered' do
        it 'orders the records of Card by :nid' do
          create :card
          create :card
          expect(Card.ordered).to eq Card.order(:nid)
        end
      end   # .ordered
    end   # scopes
  end   # class methods

end
