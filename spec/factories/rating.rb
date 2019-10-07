FactoryBot.define do
  factory :rating do |f|
    f.user_id {FactoryBot.create :user}
    f.tour_id {FactoryBot.create :tour, category_id: FactoryBot.create(:category).id}
    f.star {rand(1..5)}
  end
end