# Model Deck defines Deck represented in Collection as json
#
class Deck

  extend ActiveModel::Translation
  # include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
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
  attr_accessor :mid
  attr_accessor :resched
  attr_accessor :return
  attr_accessor :separate
  attr_accessor :terms
  attr_accessor :usn
  attr_accessor :mod
  # attr_accessor :newToday
  # attr_accessor :lrnToday
  # attr_accessor :revToday
  # attr_accessor :timeToday

  validates :collection, :id, :name, presence: true

  class << self
    def all(collection_id = 1)
      Collection.find(collection_id).decks.values
    end

    def find(id, collection_id = 1)
      Collection.find(collection_id).decks[id]
    end

    def find_by_name(deck_name)
      Collection.all.detect do |collection|
        id, deck = collection.decks.detect{|k, d| d.name == deck_name}
        deck and return deck
      end
    end
  end   # class << self

  def initialize(attributes = nil)
    reset_counters
    attributes ||= {}
    attributes.each do |attr, value|
      send "#{attr}=", value
    end
  end

  def ==(other)
    to_hash == other.to_hash
  end

  def collection=(collection)
    @collection = collection
  end

  def collection_id=(collection_id)
    @collection = Collection.find_by id: collection_id
  end

  def currentDay
    @lrnToday[0]
  end

  def currentDay=(value)
    @lrnToday[0] = value
    @newToday[0] = value
    @revToday[0] = value
    @timeToday[0] = value
  end

  def new_record?
    id.blank?
  end

  def lrnToday
    @lrnToday[1]
  end

  def lrnToday=(value)
    if value.is_a? Array
      @lrnToday = value
    else
      @lrnToday[1] = value
    end
  end

  def newToday
    @newToday[1]
  end

  def notes
    Note.where mid: mid
  end

  def newToday=(value)
    if value.is_a? Array
      @newToday = value
    else
      @newToday[1] = value
    end
  end

  def persisted?
    id.present?
  end

  def reload
    collection.reload.decks[id]
  end

  def revToday
    @revToday[1]
  end

  def revToday=(value)
    if value.is_a? Array
      @revToday = value
    else
      @revToday[1] = value
    end
  end

  def save
    set_id!
    valid? and collection.save_deck self
  end

  def save!
    set_id!
    valid? and collection.save_deck! self
  end

  def timeToday
    @timeToday[1]
  end

  def timeToday=(value)
    if value.is_a? Array
      @timeToday = value
    else
      @timeToday[1] = value
    end
  end

  def to_hash
    {
      id: id,
      name: name,
      lrnToday: @lrnToday,
      newToday: @newToday,
      revToday: @revToday,
      timeToday: @timeToday,
      browserCollapsed: browserCollapsed,
      collapsed: collapsed,
      conf: conf,
      delays: delays,
      desc: desc,
      dyn: dyn,
      extendNew: extendNew,
      extendRev: extendRev,
      mid: mid,
      resched: resched,
      :return => @return,
      separate: separate,
      terms: terms,
      usn: usn,
      mod: mod,
    }
  end

  def update(attributes = {})
    attributes.each do |attr, value|
      send "#{attr}=", value
    end
    valid? and collection.save_deck! self
  end

  private

  def set_id!
    self.id ||= (Time.now.to_i * 1000).to_s
  end

  def reset_counters
    @lrnToday = [0, 0]
    @newToday = [0, 0]
    @revToday = [0, 0]
    @timeToday = [0, 0]
  end
end
