class Review < ApplicationRecord
  searchkick word_start: [:content]
  belongs_to :user
  belongs_to :tour
  has_one :picture, as: :picturetable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, presence: true
  accepts_nested_attributes_for :picture, allow_destroy: true
  delegate :name, to: :tour, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true
  REVIEW_PARAMS = [:content, picture_attributes: %i(id picture_link _destroy)].freeze
  scope :with_likes, -> {joins(:likes).select("reviews.*, sum(likes.user_id) as user_liked, count(likes.review_id) as review_of_likes")
    .group(:review_id).order("user_liked DESC, review_of_likes DESC")}

  def search_data
    {
      content: content
    }
  end
end
