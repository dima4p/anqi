FactoryBot.define do
  factory :deck do
    id { Time.now.to_i }
    sequence(:name) {|n| "Name#{format '%03d', n}" }
    sequence(:browserCollapsed) {|n| "Browsercollapsed#{format '%03d', n}" }
    sequence(:collapsed) {|n| "Collapsed#{format '%03d', n}" }
    sequence(:conf) {|n| "Conf#{format '%03d', n}" }
    sequence(:delays) {|n| "Delays#{format '%03d', n}" }
    sequence(:desc) {|n| "Desc#{format '%03d', n}" }
    sequence(:dyn) {|n| "Dyn#{format '%03d', n}" }
    sequence(:extendNew) {|n| "Extendnew#{format '%03d', n}" }
    sequence(:extendRev) {|n| "Extendrev#{format '%03d', n}" }
    sequence(:lrnToday) {|n| "Lrntoday#{format '%03d', n}" }
    sequence(:mid) {|n| "Mid#{format '%03d', n}" }
    sequence(:newToday) {|n| "Newtoday#{format '%03d', n}" }
    sequence(:resched) {|n| "Resched#{format '%03d', n}" }
    sequence(:return) {|n| "Return#{format '%03d', n}" }
    sequence(:revToday) {|n| "Revtoday#{format '%03d', n}" }
    sequence(:separate) {|n| "Separate#{format '%03d', n}" }
    sequence(:terms) {|n| "Terms#{format '%03d', n}" }
    sequence(:timeToday) {|n| "Timetoday#{format '%03d', n}" }
    sequence(:usn) {|n| "Usn#{format '%03d', n}" }
    sequence(:mod) {|n| "Mod#{format '%03d', n}" }
    association :collection
  end
end
