FactoryBot.define do
  factory :booking do |f|
    f.user_id {FactoryBot.create :user}
    f.tour_id {FactoryBot.create :tour, category: FactoryBot.create(:category)}
    f.people_number {rand(1..10)}
    f.phone_number {FFaker::PhoneNumber.phone_number}
    f.price {rand(20..100)}
    f.start_time {DateTime.now + 2.day}
    f.address {FFaker::Address.city}
  end
end
