require "rails_helper"

RSpec.describe BankAccountsController, type: :controller do
  let(:user){FactoryBot.create :user}
  let!(:bank_account) {FactoryBot.create :bank_account, user: user}

  describe "GET #index" do
    before do
      get :index
    end

    it "is expected render template" do
      expect{reponse.to render_template :index}  
    end
    it "is expected status 302" do
      expect{reponse.to status 302}
    end
  end
  

  describe "POST #create" do
    before do
      post :create, params: bank_account.attributes
    end
    it "create bank account" do
      expect{assigns(:bank_account).to change(BankAccount.count).by 1}
    end
  end

  describe "GET #edit" do
    before do
      get :edit, params: {id: bank_account.id}
    end
    it "is exepected form" do
      expect{response.to render_template :edit}
    end
    it "is expected find user instance variable" do
      expect{assigns(:bank_account).to eq Post.find_by id: bank_account.id}
    end
  end
  

  describe "PATCH #update" do
  let(:bank_account){FactoryBot.create :bank_account, name: "EPAY", user: user}
    before do
      get :edit, params: bank_account.attributes
    end
    it "update bank account" do
      expect{(bank_account.name).to eq("EPAY")}
    end
  end

  describe "DELETE #destroy" do
    before do
      delete :destroy, params: {id: bank_account.id}
    end
    it "delete bank account" do
      expect{assigns(:status).to eq(:success)}
    end
  end
end
