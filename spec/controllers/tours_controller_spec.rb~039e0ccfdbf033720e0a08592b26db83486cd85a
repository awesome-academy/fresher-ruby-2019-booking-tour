require "rails_helper"

RSpec.describe ToursController, type: :controller do
  describe "GET #index" do
    let(:search) {{
      "q"=>{
        "c"=>{
          "0"=>{
            "a"=>{
              "0"=>{
                "name"=>"Koelpin"
              }
            }
          }
        }
      }
    }}
    let(:category) {FactoryBot.create(:category)}
    let(:tour){FactoryBot.create :tour, name: "Koelpin", category: category}
    
    it "is expected render template" do
      expect{response.to render_template :index}
    end
    
    it "is expected status 302" do
      expect{response.to status eq 302}  
    end
    
    before do
      get :index, params: search
    end
    
    it "get all match the key words" do
      expect(search["q"]["c"]["0"]["a"]["0"]["name"]).to include tour.name
    end
  end
end
