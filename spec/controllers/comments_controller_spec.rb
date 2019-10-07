require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "before action" do
    it{should use_before_action :authenticate_user!}
    it{should use_before_action :load_comment}
  end
  
  describe "POST #create" do
    let(:user){FactoryBot.create :user}
    let(:category){FactoryBot.create :category}
    let(:tour){FactoryBot.create :tour, category: category}
    let(:review){FactoryBot.create :review, tour: tour, user: user}
    let(:comment){FactoryBot.create :comment, user_id: user.id, review: review, commentable_type: "Review",commentable_id: review.id }
    before do
      post :create, params: comment.attributes
    end
    it "create comment" do
      expect{assigns(:comment).to change(Comment.count).by 1}
    end
  end
  
  describe "GET #reply" do
    it "is expected render template" do
      expect{response.to render_template :reply}
    end

    it "is expected status 302" do
      expect{response.to status eq 302}  
    end
  end

  describe "DELETE #destroy" do
    let(:user){FactoryBot.create :user}
    let(:category){FactoryBot.create :category}
    let(:tour){FactoryBot.create :tour, category: category}
    let(:review){FactoryBot.create :review, tour: tour, user: user}
    let(:comment){FactoryBot.create :comment, user_id: user.id, review: review, commentable_type: "Review",commentable_id: review.id }

    before do
      delete :destroy, params: comment.attributes
    end

    it "delete comment" do
      expect{assigns(:comment).to change(Comment.count).by 0}
    end
  end
end
