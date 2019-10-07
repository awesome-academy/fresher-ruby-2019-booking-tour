require "rails_helper"

RSpec.describe RatingsController, type: :controller do
  
  describe "before action" do
    it{should use_before_action :authenticate_user!}
    it{should use_before_action :load_tour}
  end
  
  describe "POST #create" do
    let(:user){FactoryBot.create :user, email: "jamse@gmail.com", password: "123123"}
    let(:category){FactoryBot.create :category}
    let(:tour){FactoryBot.create :tour, category: category}
    let(:rating) {FactoryBot.create :rating, user: user, tour: tour}
    before do
      post :create, params: rating.attributes
    end
    it "create rating" do
      expect{assigns(:rating).to change(Rating.count).by 1}
    end
  end
end
