require 'rails_helper'

# attr_reader   :collection
# attr_accessor :id
# attr_accessor :name
# attr_accessor :browserCollapsed
# attr_accessor :collapsed
# attr_accessor :conf
# attr_accessor :delays
# attr_accessor :desc
# attr_accessor :dyn
# attr_accessor :extendNew
# attr_accessor :extendRev
# attr_accessor :lrnToday
# attr_accessor :mid
# attr_accessor :newToday
# attr_accessor :resched
# attr_accessor :return
# attr_accessor :revToday
# attr_accessor :separate
# attr_accessor :terms
# attr_accessor :timeToday
# attr_accessor :usn
# attr_accessor :mod

describe Deck, type: :model do

  subject(:deck) { build :deck }

  describe 'validations' do
    it { should be_valid }
    it { should validate_presence_of :id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :collection }
    it { should validate_presence_of :model }
  end   # validations

  describe "class" do
    describe ".all" do
      let(:collection) {create :collection_with_decks}
      let!(:decks) {collection.decks}

      it "returns an arrays of the collection decks" do
        expect(described_class.all(collection.id).size).to be 1
        expect(described_class.all(collection.id).first.id).to eq decks.values.first.id
      end
    end

    describe ".find(id)" do
      let(:collection) {create :collection_with_decks}
      let!(:deck) {collection.decks.values.first}

      subject {described_class.find deck_id, collection.id}

      context "when a corresponding deck exists" do
        let(:deck_id) {deck.id}

        it "returns the corresponding deck" do
          expect(subject.collection).to eq deck.collection
        end

        it "returns the Deck with the assigned collection" do
          expect(subject.collection).to be_a Collection
          expect(subject.collection).to eq collection
        end

        it "returns the Deck with the assigned model" do
          expect(subject.model).to be_a Model
          expect(subject.model).to eq collection.models.values.first
        end
      end

      context "when a corresponding deck does not exist" do
        let(:deck_id) {0}

        it "returns nil" do
          is_expected.to be_nil
        end
      end
    end

    describe '.find_by_name(deck_name)' do
      let(:collection) {create :collection_with_decks}
      let!(:deck) {collection.decks.values.first}

      subject {described_class.find_by_name deck_name}

      context "when the deck_name exists" do
        let(:deck_name) {deck.name}

        it "returns the Deck with the given name" do
          is_expected.to eq deck
        end

        it "returns the Deck with the assigned collection" do
          expect(subject.collection).to be_a Collection
          expect(subject.collection).to eq collection
        end

        it "returns the Deck with the assigned model" do
          expect(subject.model).to be_a Model
          expect(subject.model).to eq collection.models.values.first
        end
      end

      context "when the deck_name does not exist" do
        let(:deck_name) {deck.name + '_'}

        it "returns nil" do
          is_expected.to be_nil
        end
      end
    end
  end   # class

  describe ":collection=" do
    let(:collection) {build :collection}

    it 'assigns the given collection to @collection' do
      deck.collection = collection
      expect(subject.collection).to be collection
    end
  end

  describe ":collection_id=" do
    let(:collection) {create :collection}

    context "when a Collection with this id is present" do
      it 'findd the collection and assigns it to @collection' do
        deck.collection_id = collection.id
        expect(subject.collection).to eq collection
      end
    end

    context "when not Collection with the given id exist" do
      it "assigns nil to @collection" do
        deck.collection_id = 0
        expect(subject.collection).to be_nil
      end
    end
  end

  describe '#currentDay' do
    subject {deck.currentDay}

    it 'returns @currentDay[1]' do
      is_expected.to be deck.instance_variable_get(:@lrnToday)[0]
    end
  end

  describe '#currentDay=' do
    it 'returns @currentDay[1]' do
      deck.currentDay = 11
      expect(deck.instance_variable_get(:@lrnToday)[0]).to eq 11
      expect(deck.instance_variable_get(:@newToday)[0]).to eq 11
      expect(deck.instance_variable_get(:@revToday)[0]).to eq 11
      expect(deck.instance_variable_get(:@timeToday)[0]).to eq 11
    end
  end

  describe '#lrnToday' do
    subject {deck.lrnToday}

    it 'returns @lrnToday[1]' do
      is_expected.to be deck.instance_variable_get(:@lrnToday)[1]
    end
  end

  describe '#lrnToday=' do
    subject {deck.instance_variable_get(:@lrnToday)}

    it 'returns @lrnToday[1]' do
      deck.lrnToday = 55
      is_expected.to eq [0, 55]
    end
  end

  describe "#notes_count" do
    subject {deck.notes_count}
    let(:note1) {create :note, mid: deck.mid}
    let(:note2) {create :note, mid: deck.mid}
    let!(:card1) {create :card, nid: note1.id, did: deck.id}
    let!(:card2) {create :card, nid: note2.id, did: deck.id}

    it "returns the number of corresponding Notes" do
      is_expected.to be 2
    end
  end

  describe '#newToday' do
    subject {deck.newToday}

    it 'returns @newToday[1]' do
      is_expected.to be deck.instance_variable_get(:@newToday)[1]
    end
  end

  describe '#newToday=' do
    subject {deck.instance_variable_get(:@newToday)}

    it 'returns @newToday[1]' do
      deck.newToday = 55
      is_expected.to eq [0, 55]
    end
  end

  describe "#notes" do
    let(:note) {create :note, mid: deck.mid}
    let!(:card) {create :card, nid: note.id, did: deck.id}

    subject {deck.notes}

    it 'returns an ActiveRecord::Relation' do
      is_expected.to be_an ActiveRecord::Relation
    end

    it 'returns an ActiveRecord::Relation of size 1' do
      expect(subject.count).to be 1
    end
  end

  describe "#persisted?" do
    subject {deck.persisted?}

    context "when #id is present" do
      it "returns true" do
        is_expected.to be true
      end
    end

    context "when #id is not present" do
      let(:deck) {build :deck, id: nil}

      it "returns false" do
        is_expected.to be false
      end
    end
  end

  describe "#reload" do
    let(:collection) {create :collection_with_decks}
    let(:deck) {collection.decks.values.first}

    subject {deck.reload}

    it "returns the deck" do
      is_expected.to eq deck
    end
  end

  describe '#revToday' do
    subject {deck.revToday}

    it 'returns @revToday[1]' do
      is_expected.to be deck.instance_variable_get(:@revToday)[1]
    end
  end

  describe '#revToday=' do
    subject {deck.instance_variable_get(:@revToday)}

    it 'returns @revToday[1]' do
      deck.revToday = 55
      is_expected.to eq [0, 55]
    end
  end

  describe "#save!" do
    let(:collection) {deck.collection}

    it "makes the changes permanent" do
      deck.name = "my new name"
      logger.debug "Rspec Deck@#{__LINE__}#save! #{deck.inspect}" if logger.debug?
      deck.save!
      expect(collection.decks[deck.id].name).to eq "my new name"
    end

    it "generates deck.id if it is blank" do
      deck.id = nil
      deck.save!
      expect(deck.id).to be_a String
    end
  end

  describe '#timeToday' do
    subject {deck.timeToday}

    it 'returns @timeToday[1]' do
      is_expected.to be deck.instance_variable_get(:@timeToday)[1]
    end
  end

  describe '#timeToday=' do
    subject {deck.instance_variable_get(:@timeToday)}

    it 'returns @timeToday[1]' do
      deck.timeToday = 55
      is_expected.to eq [0, 55]
    end
  end

  describe "#update" do
    subject {deck.update}

    it 'returns true' do
      is_expected.to be true
    end
  end
end
