require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  let(:user){FactoryBot.create :user}
  let(:category){FactoryBot.create :category}
  let(:tour){FactoryBot.create :tour, category: category}
  let(:booking){FactoryBot.create :booking, user: user, tour: tour}

  describe "before action" do
    it{should use_before_action :load_tour}
    it{should use_before_action :authenticate_user!}
  end
  

  describe "POST #create" do
    before {
      post :create, params: booking.attributes
    }

    it "create booking" do
      expect{assigns(:booking).to change(Booking.count).by 1}  
    end
    
    let(:booking){FactoryBot.create(:booking, price: 0, user: user, tour: tour)}
    
    context "create booking fail" do
      before do
        post :create, params: booking.attributes
      end
      
      it  do 
        expect{ (booking.save!).to.to change(Booking.count)}
      end
    end
  end
end
