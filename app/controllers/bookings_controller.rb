class BookingsController < ApplicationController
  before_action :authenticate_user!, :load_tour

  def create
    @booking = current_user.bookings.build booking_params
    @booking.tour = @tour
    
    if BookingService.new(@booking).booking_request? && @booking.save
      BookingService.new(@booking).bank_account_after_booking
      flash[:success] = t ".success_booking"
    else
      flash[:danger] = t ".fail_booking"
    end
    redirect_to @tour
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
