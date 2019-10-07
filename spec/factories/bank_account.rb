FactoryBot.define do
  factory :bank_account do |f|
    f.name {"Master card"}
    f.account_number {FFaker::Code.ean}
    f.user_id {FactoryBot.create :user}
  end
end