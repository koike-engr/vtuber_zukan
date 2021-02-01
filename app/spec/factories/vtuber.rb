FactoryBot.define do
  factory :vtuber do
    name { "社築" }
    subscribers { 39.5 }
    superchats { 23612673 }

    trait :without_name do
      name { nil }
    end
  end

  factory :kuzuha, class: Vtuber do
    name { "葛葉" }
    subscribers { 63.3 }
    superchats { 88353025 }

    trait :without_name do
      name { nil }
    end
  end
end
