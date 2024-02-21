FactoryBot.define do
  factory :item do
    name { "MyString" }
    reminder_period { 1 }
    user { nil }
  end
end
