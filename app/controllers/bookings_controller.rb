class BookingsController < ApplicationController
  before_action :require_user_login
  before_action :load_tour

  def create
    @booking = current_user.bookings.build booking_params
    @booking.tour = @tour
    booking_service = BookingService.new(@booking, params[:tour_price].to_i)
    @booking_request = booking_service.booking_request?
    @balance_is_not = t ".balance_is_not"
    
    if @booking_request && @booking.save
      booking_service.bank_account_after_booking
    end
    respond_to :js
  end

  private

  def booking_params
    params.require(:booking).permit Booking::BOOKING_PARAMS
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end
end
