# Model Collection defines the Collection
#
class Collection < ApplicationRecord

  validates :crt, :mod, :scm, :ver, :dty, :usn, :ls, :conf, :models, :decks, :dconf, :tags,
      presence: true

  scope :ordered, -> { order(:crt) }

end
