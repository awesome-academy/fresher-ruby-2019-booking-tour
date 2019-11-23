module BookingsHelper
  def load_bank_account user
    user.bank_accounts.pluck :name, :id
  end
end