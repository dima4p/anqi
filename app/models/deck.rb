# Model Deck defines Deck represented in Collection as json
#
class Deck

  # include ActiveModel::AttributeMethods
  include ActiveModel::Validations

  attr_reader   :collection
  attr_accessor :id
  attr_accessor :name
  attr_accessor :browserCollapsed
  attr_accessor :collapsed
  attr_accessor :conf
  attr_accessor :delays
  attr_accessor :desc
  attr_accessor :dyn
  attr_accessor :extendNew
  attr_accessor :extendRev
  attr_accessor :lrnToday
  attr_accessor :mid
  attr_accessor :newToday
  attr_accessor :resched
  attr_accessor :return
  attr_accessor :revToday
  attr_accessor :separate
  attr_accessor :terms
  attr_accessor :timeToday
  attr_accessor :usn
  attr_accessor :mod

  validates :collection, :id, :name, presence: true

  class << self
    def all(collection_id = 1)
      Collection.find(collection_id).decks.values
    end
  end   # class << self

  def initialize(attributes = nil)
    attributes ||= {}
    attributes.each do |attr, value|
      send "#{attr}=", value
    end
  end

  def collection=(collection)
    @collection = collection
  end

  def collection_id=(collection_id)
    @collection = Collection.find_by id: collection_id
  end

  def save!
    self.id ||= (Time.now.to_i * 1000).to_s
    collection.save_deck! self
  end

  def to_hash
    {
      id: id,
      name: name,
      browserCollapsed: browserCollapsed,
      collapsed: collapsed,
      conf: conf,
      delays: delays,
      dyn: dyn,
      extendNew: extendNew,
      extendRev: extendRev,
      lrnToday: lrnToday,
      mid: mid,
      newToday: newToday,
      resched: resched,
      :return => @return,
      revToday: revToday,
      separate: separate,
      terms: terms,
      timeToday: timeToday,
      usn: usn,
      mod: mod,
    }
  end
end
