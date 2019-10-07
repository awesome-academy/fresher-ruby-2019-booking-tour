require "rails_helper"

RSpec.describe BankAccountsController, type: :controller do
  let(:user){FactoryBot.create :user}
  let(:bank_account) {FactoryBot.create :bank_account, user: user}

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
end
