FactoryBot.define do
  factory :card do
    sequence(:nid) {|n| "1#{format '%03d', n}" }
    sequence(:did) {|n| "2#{format '%03d', n}" }
    sequence(:ord) {|n| "3#{format '%03d', n}" }
    sequence(:mod) {|n| "4#{format '%03d', n}" }
    sequence(:usn) {|n| "5#{format '%03d', n}" }
    sequence(:type) {|n| "6#{format '%03d', n}" }
    sequence(:queue) {|n| "7#{format '%03d', n}" }
    sequence(:due) {|n| "8#{format '%03d', n}" }
    sequence(:ivl) {|n| "9#{format '%03d', n}" }
    sequence(:factor) {|n| "10#{format '%03d', n}" }
    sequence(:reps) {|n| "11#{format '%03d', n}" }
    sequence(:lapses) {|n| "12#{format '%03d', n}" }
    sequence(:left) {|n| "13#{format '%03d', n}" }
    sequence(:odue) {|n| "14#{format '%03d', n}" }
    sequence(:odid) {|n| "15#{format '%03d', n}" }
    sequence(:flags) {|n| "16#{format '%03d', n}" }
    sequence(:data) {|n| "Data#{format '%03d', n}" }
  end
end
