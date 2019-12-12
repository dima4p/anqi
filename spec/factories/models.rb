FactoryBot.define do
  factory :model do
    sequence(:vers) {|n| "Vers#{format '%03d', n}" }
    sequence(:name) {|n| "Name#{format '%03d', n}" }
    sequence(:tags) {|n| "Tags#{format '%03d', n}" }
    sequence(:did) {|n| "Did#{format '%03d', n}" }
    sequence(:usn) {|n| "Usn#{format '%03d', n}" }
    sequence(:req) {|n| "Req#{format '%03d', n}" }
    sequence(:flds) {|n| "Flds#{format '%03d', n}" }
    sequence(:sortf) {|n| "Sortf#{format '%03d', n}" }
    sequence(:latexPre) {|n| "Latexpre#{format '%03d', n}" }
    sequence(:tmpls) {|n| "Tmpls#{format '%03d', n}" }
    sequence(:latexPost) {|n| "Latexpost#{format '%03d', n}" }
    sequence(:type) {|n| "Type#{format '%03d', n}" }
    sequence(:id) {|n| "Id#{format '%03d', n}" }
    sequence(:css) {|n| "Css#{format '%03d', n}" }
    sequence(:mod) {|n| "Mod#{format '%03d', n}" }
  end
end
