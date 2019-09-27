class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_one :picture, as: :picturetable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :picture, allow_destroy: true
  delegate :name, to: :tour, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true

  scope :review_have_nteractive, -> {joins(:likes).select("reviews.*, sum(likes.user_id) as sum_likes, count(likes.review_id) as number_of_likes")
    .group(:review_id).order("sum_likes DESC, number_of_likes DESC")}
  REVIEW_PARAMS = [:content, picture_attributes: %i(id picture_link _destroy)].freeze
end
