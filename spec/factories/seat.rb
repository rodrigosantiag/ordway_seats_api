FactoryBot.define do
  factory :seat do
    row { Faker::Number.within(range: 'a'..'z') }
    column { Faker::Number.within(range: 1..26) }
    status { ['AVAILABLE', 'UNAVAILABLE'].sample }
    layout
  end
end
