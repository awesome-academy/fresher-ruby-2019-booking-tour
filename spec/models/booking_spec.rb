require "rails_helper"

RSpec.describe Booking, type: :model do
  context "Associations" do
    it{is_expected.to belong_to(:user)}
    it{is_expected.to belong_to(:tour)}
  end
  
  context "Validates" do
    let(:user){FactoryBot.create :user}
    let(:category){FactoryBot.create :category}
    let(:tour){FactoryBot.create :tour, category: category}
    let(:booking){FactoryBot.create :booking, user: user, tour: tour, start_time: DateTime.now-1.day}
    it{should validate_presence_of :price}
    it{should validate_presence_of :start_time}
    it{should validate_presence_of :address}
    it{should validate_presence_of :people_number}
    it{should validate_presence_of :start_time}
    it{should validate_numericality_of(:price).is_greater_than_or_equal_to(Settings.bookings.price)}
    it{should validate_numericality_of(:people_number).is_greater_than_or_equal_to(Settings.bookings.people_number)}
    it "start_time_booking" do
      expect{ booking.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
