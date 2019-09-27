module ToursHelper
  def convert_category
    Category.pluck :name, :id
  end
  
  def tour_picture tour
    if tour&.picture && tour.picture.picture_link?
      tour.picture.picture_link.url
    else
      Settings.tour_picture
    end
  end
  def average_review tour
    arr_rate = tour.ratings.pluck :star

    return 0 if arr_rate.empty?
    arr_rate.inject(0.0){ |sum, star| sum += star }.to_f / arr_rate.size
  end
end
