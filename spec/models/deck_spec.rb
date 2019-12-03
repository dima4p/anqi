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
  end   # validations

  describe "class" do

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

end
