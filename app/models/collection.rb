# Model Collection defines the Collection
#
class Collection < ApplicationRecord

  establish_connection ActiveRecord::Base.configurations["anki"] if Rails.env.development?
  self.table_name = "col"

  validates :crt, :mod, :scm, :ver, :dty, :usn, :ls, :conf, :models, :decks, :dconf, :tags,
      presence: true

  serialize :conf, JSON
  serialize :models, JSON
  serialize :decks, JSON
  serialize :dconf, JSON
  serialize :tags, JSON

  scope :ordered, -> { order(:crt) }

end
