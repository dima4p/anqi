FactoryBot.define do
  factory :deck do
    id { (Time.current.to_f * 1000).to_i.to_s }
    sequence(:name) {|n| "Name#{format '%03d', n}" }
    sequence(:browserCollapsed) {|n| "Browsercollapsed#{format '%03d', n}" }
    sequence(:collapsed) {|n| "Collapsed#{format '%03d', n}" }
    sequence(:conf) {|n| "Conf#{format '%03d', n}" }
    sequence(:delays) {|n| "Delays#{format '%03d', n}" }
    sequence(:desc) {|n| "Desc#{format '%03d', n}" }
    sequence(:dyn) {|n| "Dyn#{format '%03d', n}" }
    sequence(:extendNew) {|n| 100 + n }
    sequence(:extendRev) {|n| 101 + n }
    sequence(:lrnToday) {|n| 200 + n }
    sequence(:mid) {|n| (Time.current.to_f * 1000).to_i}
    sequence(:newToday) {|n| 150 + n }
    sequence(:resched) {|n| "Resched#{format '%03d', n}" }
    sequence(:return) {|n| "Return#{format '%03d', n}" }
    sequence(:revToday) {|n| "Revtoday#{format '%03d', n}" }
    sequence(:separate) {|n| "Separate#{format '%03d', n}" }
    sequence(:terms) {|n| "Terms#{format '%03d', n}" }
    sequence(:timeToday) {|n| 10000 + n }
    sequence(:usn) {|n| "Usn#{format '%03d', n}" }
    sequence(:mod) {|n| "Mod#{format '%03d', n}" }
    association :collection

    after :build do |deck|
      deck.model = deck.collection.models.values.first
      deck.mid = deck.model.id
    end
  end
end
