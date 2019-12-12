# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  nid        :integer
#  did        :integer
#  ord        :integer
#  mod        :integer
#  usn        :integer
#  type       :integer
#  queue      :integer
#  due        :integer
#  ivl        :integer
#  factor     :integer
#  reps       :integer
#  lapses     :integer
#  left       :integer
#  odue       :integer
#  odid       :integer
#  flags      :integer
#  data       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Card, type: :model do

  subject(:card) { create :card }

  describe 'validations' do
    it { should be_valid }
    it { should validate_presence_of :nid }
    it { should validate_presence_of :did }
    it { should validate_presence_of :ord }
    it { should validate_presence_of :mod }
    it { should validate_presence_of :usn }
    it { should validate_presence_of :type }
    it { should validate_presence_of :queue }
    it { should validate_presence_of :due }
    it { should validate_presence_of :ivl }
    it { should validate_presence_of :factor }
    it { should validate_presence_of :reps }
    it { should validate_presence_of :lapses }
    it { should validate_presence_of :left }
    it { should validate_presence_of :odue }
    it { should validate_presence_of :odid }
    it { should validate_presence_of :flags }
    it { should validate_presence_of :data }
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
