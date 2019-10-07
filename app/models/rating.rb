class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  RATING_PARAMS = %i(star)
end
