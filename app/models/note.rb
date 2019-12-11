# Model Note defines ... TODO:
#
class Note < ApplicationRecord

  establish_connection ActiveRecord::Base.configurations["anki"] if Rails.env.development?

  scope :ordered, -> { order(:guid) }

end
