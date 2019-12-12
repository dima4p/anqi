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

FactoryBot.define do
  factory :collection do
    sequence(:crt) {|n| "1#{format '%03d', n}" }
    sequence(:mod) {|n| "2#{format '%03d', n}" }
    sequence(:scm) {|n| "3#{format '%03d', n}" }
    sequence(:ver) {|n| "4#{format '%03d', n}" }
    sequence(:dty) {|n| "5#{format '%03d', n}" }
    sequence(:usn) {|n| "6#{format '%03d', n}" }
    sequence(:ls) {|n| "7#{format '%03d', n}" }
    sequence(:conf) {|n| {"key#{format '%03d', n}": "value#{format '%03d', n}"}}
    sequence(:dconf) {|n| {"key#{format '%03d', n}": {"k#{format '%03d', n}": "v#{format '%03d', n}"}}}
    sequence(:tags) {|n| "Tags#{format '%03d', n}" }
    decks {{}}
    sequence(:models) do |n|
      id = (Time.now.to_i * 1000 + n)
      sid = id.to_s
      {
        sid => {
          "id" => id,
        }
      }
    end

    factory :collection_with_decks do
      sequence(:decks) do |n|
        id = (Time.now.to_i * 1000 + n).to_s
        {
          id => {
            "id" => id,
            "name" => "name#{format '%03d', n}",
            "lrnToday" => [1900, rand(0..9)],
            "newToday" => [1900, rand(10..19)],
          }
        }
      end
    end
  end
end
