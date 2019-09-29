FactoryBot.define do
  factory :like do |f|
    f.user_id {FactoryBot.create :user}
    f.review_id {FactoryBot.create(:review, tour: FactoryBot.create(:tour, category: FactoryBot.create(:category)))}
  end
end