module ReviewsHelper
  def convert_times time
    time.strftime(Settings.time_post_review)
  end
end
