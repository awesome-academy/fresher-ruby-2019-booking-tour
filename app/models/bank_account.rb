class BankAccount < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :account_number, presence: true
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than_or_equal_to: Settings.bank_accounts.amount
  delegate :name, to: :user, prefix: true
  scope :bank_account_last, -> {order created_at:  :desc}
  BANK_ACCOUNT_PARAMS = %i(name account_number).freeze
  AMOUNT = 400

  def amount_bank_acount
    update amount: AMOUNT
  end
end
