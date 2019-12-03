# == Schema Information
#
# Table name: col
#
#  id     :integer          primary key
#  crt    :integer          not null
#  mod    :integer          not null
#  scm    :integer          not null
#  ver    :integer          not null
#  dty    :integer          not null
#  usn    :integer          not null
#  ls     :integer          not null
#  conf   :text             not null
#  models :text             not null
#  decks  :text             not null
#  dconf  :text             not null
#  tags   :text             not null
#

require 'rails_helper'

describe Collection, type: :model do

  subject { create :collection }

  describe 'validations' do
    it { should be_valid }
    it {should validate_presence_of :crt}
    it {should validate_presence_of :mod}
    it {should validate_presence_of :scm}
    it {should validate_presence_of :ver}
    it {should validate_presence_of :dty}
    it {should validate_presence_of :usn}
    it {should validate_presence_of :ls}
    it {should validate_presence_of :conf}
    it {should validate_presence_of :models}
    it {should validate_presence_of :decks}
    it {should validate_presence_of :dconf}
    it {should validate_presence_of :tags}
  end   # validations

  describe 'class methods' do
    describe 'scopes' do
      describe '.ordered' do
        it 'orders the records of Collection by :crt' do
          create :collection
          create :collection
          expect(Collection.ordered).to eq Collection.order(:crt)
        end
      end   # .ordered
    end   # scopes
  end   # class methods

end
