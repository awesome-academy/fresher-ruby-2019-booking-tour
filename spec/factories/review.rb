FactoryBot.define do
  factory :review do |f|
    f.user_id {FactoryBot.create :user}
    f.tour_id {FactoryBot.create :tour, category_id: FactoryBot.create(:category).id}
    f.content {"content"}
  end
end
