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

# Model Note defines notes
#
class Note < ApplicationRecord

  TABLE91 = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a +
      "!#$%&()*+,-./:;<=>?@[]^_`{|}~".split('')
  TABLE91_SIZE = TABLE91.size

  establish_connection ActiveRecord::Base.configurations["anki"] if Rails.env.development?

  has_many :cards, foreign_key: :nid

  before_validation :generate_guid
  validates :mid, :mod, :usn, :flds, :sfld, :csum, :flags,
      presence: true

  scope :ordered, -> { order(:id) }
  scope :for_deck, -> (deck) do
    deck = deck.id if deck.is_a? Deck
    joins(:cards).where(cards: {did: deck}).distinct
  end
  scope :for_model, -> (model) do
    model = model.id if model.is_a? Model
    where mid: model
  end

  def fields
    @fieflds ||= flds.split("\x1f").each_with_index.each_with_object({}) do |(field, index), result|
      result[model.flds[index]['name']] = field
    end
  end

  def model
    return @model if @model
    Collection.all.detect do |collecion|
      @model = collecion.models[mid.to_s]
    end
    @model
  end

  def model=(model)
    @model = model if model.is_a? Model
  end

  def method_missing(method, *args)
    return super if args.size != 0
    key = method.to_s.camelcase
    return super unless fields.keys.include? key
    fields[key]
  end

  private

  def generate_guid
    while guid.blank? or Note.where(guid: guid).count > 1
      self.guid = guid64
    end
  end

  def guid64
    start = rand(0...2**64)
    res = ""
    while start > 0
      res << TABLE91[start % TABLE91_SIZE]
      start /= TABLE91_SIZE
    end
    res
  end
end
