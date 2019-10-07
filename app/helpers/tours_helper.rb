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
end
