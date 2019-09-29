FactoryBot.define do
  factory :bank_account do |f|
    f.name {"Master card"}
    f.account_number {FFaker::Code.ean}
    f.user_id {FactoryBot.create :user}
    f.amount {rand(10..20)}
  end
end