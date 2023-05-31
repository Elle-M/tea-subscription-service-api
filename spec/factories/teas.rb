FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.between(from: 100, to: 200).to_s + " degrees" }
    brew_time { Faker::Number.between(from: 1, to: 5).to_s + " minutes" }
  end
end
