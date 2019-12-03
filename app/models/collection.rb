# == Schema Information
#
# Table name: col
#
#  id     :integer          primary key
#  crt    :integer          not null
#  mod    :integer          not null
#  scm    :integer          not null
#  ver    :integer          not null
#  dty    :integer          not null
#  usn    :integer          not null
#  ls     :integer          not null
#  conf   :text             not null
#  models :text             not null
#  decks  :text             not null
#  dconf  :text             not null
#  tags   :text             not null
#

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
