FactoryBot.define do
  factory :comment do |f|
    f.user_id {FactoryBot.create :user}
    f.review_id {FactoryBot.create :review, user: FactoryBot.create(:user), tour: FactoryBot.create(:tour, category: FactoryBot.create(:category))}
    f.content {"comment say"}
  end
end
