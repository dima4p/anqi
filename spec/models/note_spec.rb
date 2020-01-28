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

  subject(:note) { create :note }

  describe 'validations' do
    it { should be_valid }
    it { should validate_presence_of :mid }
    it { should validate_presence_of :mod }
    it { should validate_presence_of :usn }
    it { should validate_presence_of :tags }
    it { should validate_presence_of :flds }
    it { should validate_presence_of :sfld }
    it { should validate_presence_of :csum }
    it { should validate_presence_of :flags }
    it { should validate_presence_of :data }
    it { should have_many :cards }
  end   # validations

  describe 'class methods' do
    describe 'scopes' do
      describe '.ordered' do
        it 'orders the records of Note by :guid' do
          create :note
          create :note
          expect(Note.ordered).to eq Note.order(:id)
        end
      end   # .ordered

      describe '.for_deck' do
        let(:collection) {create :collection_with_decks}
        let(:deck1) {collection.decks.first.last}
        let(:deck2) {build :deck}
        let(:model) {collection.models.values.first}
        let(:note1) {create :note, mid: model.id}
        let(:note2) {create :note, mid: model.id}
        let(:note3) {create :note, mid: model.id}
        let!(:card1) {create :card, nid: note1.id, did: deck1.id}
        let!(:card1a) {create :card, nid: note1.id, did: deck1.id}
        let!(:card2) {create :card, nid: note2.id, did: deck1.id}
        let!(:card3) {create :card, nid: note3.id, did: deck2.id}

        subject {described_class.for_deck deck1}

        it 'returns the ActiveRecord::Relation of record with the corresponding #did' do
          is_expected.to be_an ActiveRecord::Relation
          expect(subject.count).to be 2
        end
      end   # .for_deck

      describe '.for_model' do
        let(:collection) {create :collection}
        let(:model1) {collection.models.values.first}
        let!(:note1) {create :note, mid: model1.id}
        let!(:note2) {create :note, mid: model1.id}
        let(:model2) {build :model, collection: collection}
        let!(:note3) {create :note, mid: model2.id}

        subject {described_class.for_model model1}

        it "returns the ActiveRecord::Relation of record with the corresponding #mid" do
          is_expected.to be_an ActiveRecord::Relation
          expect(subject.count).to be 2
        end
      end
    end   # scopes
  end   # class methods

  describe "#fields" do
    subject {note.fields}

    it 'returns a Hash' do
      is_expected.to be_a Hash
    end
  end

  describe "#model" do
    subject {note.model}

    it 'returns a corresponding Model instance' do
      is_expected.to be_a Model
    end
  end
end
