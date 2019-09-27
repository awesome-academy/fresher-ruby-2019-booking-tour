class BookingService
  attr_reader :price, :people_number
  def initialize booking
    @booking = booking
  end

  def account_balance
    @booking.user.bank_accounts.account_amount_check(@booking.price).first
  end

  def booking_request?
    account_balance.present? ? true : false
  end

  def bank_account_after_booking
    account_balance.update amount: account_balance.amount - @booking.price
  end
end
