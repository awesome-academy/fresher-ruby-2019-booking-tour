require "rails_helper"

RSpec.describe Admin::ToursController, type: :controller do
  
  describe "before action :authenticate_user!" do
    it "is expected to define before action" do
      expect{assigns(:user).to use_before_action :authenticate_user!}
    end
  end
  
  describe "GET #index" do
    it "is expected render template" do
      expect{response.to render_template :index}
    end

    it "is expected status 200" do
      expect{response.status eq 200 }
    end
  end
  
  describe "GET #new" do
    it "is expected render template" do
      expect{response.to render_template :new}
    end

    it "is expected status 200" do
      expect{response.status eq 200 }
    end
  end
  
  describe "POST #create" do
    let(:category) {FactoryBot.create :category}
    let(:params) {FactoryBot.create :tour, category_id: category.id}
    before do
      post :create, params: params.attributes
    end
    it "create a new tour" do
      expect{assigns(:tour).to change(Tour.count).by(1)}
    end
  end

  describe "GET #edit" do
    it "is expected render template" do
      expect{response.to render_template :new}
    end

    it "is expected status 200" do
      expect{response.status eq 200 }
    end
  end
  
  describe "PATCH #update" do
    let(:category) {FactoryBot.create :category, name: "New category"}
    let(:params) {FactoryBot.create :tour, category_id: category.id, name: "TOur"}
    before do
      post :update, params: params.attributes
    end
    it "update success" do
      expect{(params.name).to eq("Tour")}
    end
  end
  
  describe "DELETE #destroy" do
    let(:category) {FactoryBot.create :category, name: "New category"}
    let(:params) {FactoryBot.create :tour, category_id: category.id, name: "TOur"}
    before do
      post :destroy, params: params.attributes
    end
    it "destroy success" do
      expect{assigns(:tour).to change(Tour.count).by(0)}
    end
  end
end
