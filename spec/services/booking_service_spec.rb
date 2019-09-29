require "rails_helper"

RSpec.describe BookingService do
  let(:user){FactoryBot.create :user}
  let(:category){FactoryBot.create :category}
  let(:tour){FactoryBot.create :tour, category: category}
  let(:booking){FactoryBot.create :booking, user: user, tour: tour}
  it "" do
   allow(BookingService.new(booking)).to receive(:booking_request?)
   BookingService.new(booking).booking_request?
  end
end
