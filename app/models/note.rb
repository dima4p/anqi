# Model Note defines ... TODO:
#
class Note < ApplicationRecord

  scope :ordered, -> { order(:guid) }

end
