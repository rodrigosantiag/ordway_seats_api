FactoryBot.define do
  factory :layout do
    rows { Faker::Number.within(range: 1..26) }
    columns { Faker::Number.within(range: 1..26) }
    venue
  end
end
