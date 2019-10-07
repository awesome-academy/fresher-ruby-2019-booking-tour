require "rails_helper"

RSpec.describe LikesController, type: :controller do
  let(:user){FactoryBot.create :user}
  let(:category){FactoryBot.create :category}
  let(:tour){FactoryBot.create :tour, category: category}
  let(:review){FactoryBot.create :review, tour: tour, user: user}
  let(:like){FactoryBot.create :like, user: user, review: review}
   
  describe "before action" do
    it{should use_before_action :authenticate_user!}
    it{should use_before_action :load_review}
  end
  
  describe "POST #create" do
    before do
      post :create, params: like.attributes
    end
    it "like" do
      expect{assigns(:like).to change(Like.count).by 1}
    end
  end
  
  describe "DELETE #destroy" do
    before do
      delete :destroy, params: like.attributes
    end
    it "unlike" do
      expect{assigns(:like).to change(Like.count).by 0}
    end
  end
end
