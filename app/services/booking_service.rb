class BookingService
  attr_reader :price, :people_number
  def initialize booking, price
    @booking = booking
    @price = price
  end

  def total_money
    @booking.people_number * @price
  end

  def account_balance
    @booking.user.bank_accounts.account_amount_check(total_money).first
  end

  def booking_request?
    account_balance.present? ? true : false
  end

  def bank_account_after_booking
    account_balance.update amount: account_balance.amount - total_money
    @booking.update price: total_money
    @booking.update status: "success"
  end
end
