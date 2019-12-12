# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  nid        :integer
#  did        :integer
#  ord        :integer
#  mod        :integer
#  usn        :integer
#  type       :integer
#  queue      :integer
#  due        :integer
#  ivl        :integer
#  factor     :integer
#  reps       :integer
#  lapses     :integer
#  left       :integer
#  odue       :integer
#  odid       :integer
#  flags      :integer
#  data       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Model Card defines Cards of the Node
#
class Card < ApplicationRecord

  establish_connection ActiveRecord::Base.configurations["anki"] if Rails.env.development?
  self.inheritance_column = nil

  belongs_to :note, foreign_key: :nid

  validates :nid, :did, :ord, :mod, :usn, :type, :queue, :due, :ivl,
          :factor, :reps, :lapses, :left, :odue, :odid, :flags, :data,
      presence: true

  scope :ordered, -> { order(:nid) }

end
