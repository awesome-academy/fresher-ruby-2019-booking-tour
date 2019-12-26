FactoryBot.define do
  factory :user do |f|
    f.name {FFaker::Name.name}
    f.email {FFaker::Internet.email}
    f.password {"123123"}
    f.role {Settings.role_default}
    f.phone_number {FFaker::PhoneNumber.phone_number}
    f.created_at {Time.zone.now}
    f.updated_at {Time.zone.now}
  end
end
