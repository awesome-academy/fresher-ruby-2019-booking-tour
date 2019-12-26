class BookingsController < ApplicationController
  before_action :load_tour, only: :create
  before_action :require_user_login

  def create
    @booking = current_user.bookings.build booking_params
    @booking.tour = @tour
    booking_service = BookingService.new(@booking, params[:tour_price].to_i)
    @booking_request = booking_service.booking_request?
    @balance_is_not = t ".balance_is_not"
    
    if @booking_request && @booking.save
      notification = @booking.create_activity(:booking, owner: @tour, recipient: current_user)
      NotificationJob.perform_later(current_user.number_of_activities, notification) if notification
      booking_service.bank_account_after_booking
    end
    respond_to :js
  end

  private

  def booking_params
    params.require(:booking).permit Booking::BOOKING_PARAMS
  end
end
