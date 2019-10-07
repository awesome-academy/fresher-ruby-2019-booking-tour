require "rails_helper"

RSpec.describe Comment, type: :model do
  context "Associations" do
    it{is_expected.to belong_to(:user)}
    it{is_expected.to belong_to(:review)}
    it{is_expected.to belong_to(:parent)}
    it{is_expected.to have_many(:replies).dependent :destroy}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :content}
  end
end
