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

FactoryBot.define do
  factory :note do
    sequence(:guid) {|n| "Guid#{format '%03d', n}" }
    sequence(:mid) {|n| "1#{format '%03d', n}" }
    sequence(:mod) {|n| "2#{format '%03d', n}" }
    sequence(:usn) {|n| "3#{format '%03d', n}" }
    sequence(:tags) {|n| "Tags#{format '%03d', n}" }
    sequence(:flds) {|n| "Flds#{format '%03d', n}" }
    sequence(:sfld) {|n| "4#{format '%03d', n}" }
    sequence(:csum) {|n| "5#{format '%03d', n}" }
    sequence(:flags) {|n| "6#{format '%03d', n}" }
    sequence(:data) {|n| "Data#{format '%03d', n}" }
  end
end
