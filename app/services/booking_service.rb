class BookingService
  attr_reader :price, :people_number
  def initialize price, booking
    @price = tour
    @booking = booking
  end

  def total_money
    @price*@booking.people_number
  end

  def account_balance
    @booking.user.bank_accounts.account_amount_check(total_money).first
  end

  def booking_request?
    account_balance.present? ? true : false
  end

  def bank_account_after_booking
    account_balance.update amount: account_balance.amount - total_money
  end
end
