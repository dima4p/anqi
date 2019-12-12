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
    sequence(:mid) do
      collection = Collection.first || create(:collection)
      collection.models.keys.first
    end
    sequence(:mod) {|n| 1342699000 + n }
    sequence(:usn) {|n| "3#{format '%03d', n}" }
    sequence(:tags) {|n| "Tags#{format '%03d', n}" }
    sequence(:flds) {|n| "Fld1#{format '%03d', n}\x1fld2#{format '%03d', n}" }
    sequence(:sfld) {|n| "4#{format '%03d', n}" }
    sequence(:csum) {|n| "5#{format '%03d', n}" }
    sequence(:flags) {|n| "6#{format '%03d', n}" }
    sequence(:data) {|n| "Data#{format '%03d', n}" }
  end
end
