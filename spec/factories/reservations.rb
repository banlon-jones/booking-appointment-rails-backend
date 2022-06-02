FactoryBot.define do
  factory :reservation do
    date_from { "2022-06-02 13:12:59" }
    date_to { "2022-06-02 13:12:59" }
    user { nil }
    resort { nil }
  end
end
