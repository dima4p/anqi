# Model Card defines ... TODO:
#
class Card < ApplicationRecord

  scope :ordered, -> { order(:nid) }

end
