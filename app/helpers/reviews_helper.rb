module ReviewsHelper
  def convert_times time
    time.strftime(Settings.time_post_review)
  end
  def filter_review tour
    tour.reviews.last_review.pluck :created_at
  end
end
