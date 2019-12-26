require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  describe "before action" do
    it{should use_before_action :load_tour}
    it{should use_before_action :require_user_login}
  end
  
  describe "GET #new" do
    it "is expected render template" do
      expect{response.to render_template :new}
    end

    it "is expected status 302" do
      expect{response.to status eq 302}  
    end
  end

  describe "POST #create" do
    let(:category){FactoryBot.create :category}
    let(:user){FactoryBot.create :user, email: "jamse@gmail.com", password: "123123"}
    let(:tour){FactoryBot.create :tour, category_id: category.id}
    let(:review){FactoryBot.create :review, tour_id: tour.id, user_id: user.id}

    before do
      post :create, params: review.attributes
    end
    it "create review" do
      expect{assigns(:review).to change(Review.count).by 1}
    end
  end
end
