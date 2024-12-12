FactoryBot.define do
  factory :article do
    association :content, factory: :content, strategy: :build
  end
end
