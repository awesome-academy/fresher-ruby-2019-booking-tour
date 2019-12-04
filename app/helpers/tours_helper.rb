module ToursHelper
  def convert_category
    Category.pluck :name, :id
  end
  
  def tour_picture tour
    if tour&.picture&.picture_link?
      tour.picture.picture_link.url
    else
      Settings.tour_picture
    end
  end

  def review_average tour
    arr_stars = tour.ratings.pluck :star
    
    return 0 if arr_stars.empty?
    arr_stars.inject(:+).to_f / arr_stars.size
  end

  def tour_with_review_likes
    Review.with_likes.includes(:tour).map(&:tour)
  end
end
