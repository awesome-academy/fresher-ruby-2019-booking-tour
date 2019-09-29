require "rails_helper"

RSpec.describe BankAccount, type: :model do
  context "Associations" do
    it{is_expected.to belong_to(:user)}
  end

  context "validates" do
    it{should validate_presence_of :name}
    it{should validate_presence_of :account_number}
    it{should validate_numericality_of(:amount).is_greater_than_or_equal_to(Settings.bank_accounts.amount)}
  end
  
  context "scope bank_account_last" do
    let(:user){FactoryBot.create :user}
    let(:bank_account){FactoryBot.create :bank_account, user: user}
    let(:bank_account1){FactoryBot.create :bank_account, user: user}
    it "order BankAccount created desc" do
      expect(BankAccount.bank_account_last).to eq [bank_account, bank_account1]
    end
  end
end
