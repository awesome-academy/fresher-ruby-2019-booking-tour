class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :star, presence: true
  scope :user_rated, -> (user_id, tour_id){where("user_id  = ? and tour_id = ?", user_id, tour_id)}
  RATING_PARAMS = %i(star)
end
