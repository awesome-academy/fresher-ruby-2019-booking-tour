class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: Comment.name, optional: true
  has_many :replies, class_name: Comment.name, foreign_key: :parent_id,
    dependent: :destroy
  validates :content, presence: true
  scope :no_parent, -> {where parent_id: nil}
  delegate :name, to: :user, prefix: true
  COMMENT_PARAMS = %i(content parent_id review_id)
end
