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
    sequence(:models) {|n| {(1411485233000 + n) => {"k#{format '%03d', n}": "v#{format '%03d', n}"}}}
    sequence(:decks) {|n| {"key#{format '%03d', n}": "value#{format '%03d', n}"}}
    sequence(:dconf) {|n| {"key#{format '%03d', n}": {"k#{format '%03d', n}": "v#{format '%03d', n}"}}}
    sequence(:tags) {|n| "Tags#{format '%03d', n}" }
  end
end
