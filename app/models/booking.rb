class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :price, presence: true,
    numericality: {greater_than_or_equal_to: Settings.bookings.price}
  validates :people_number, presence: true,
    numericality: {greater_than_or_equal_to: Settings.bookings.people_number}
  validates :address, presence: true
  validates :start_time, presence: true
  validate :start_time_cannot_less_current_time
  BOOKING_PARAMS = %i(price phone_number people_number address start_time)

  private

  def start_time_cannot_less_current_time
    return unless convert_date(self.start_time) < convert_date(DateTime.now)
    errors.add(:start_time, I18n.t(".start_time"))
  end

  def convert_date date
    date.strftime Settings.date_format
  end
end
