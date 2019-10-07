module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".travello"
    page_title.empty? ? base_title : base_title + " " + page_title
  end
  
  def index_of_list object, counter
    (object.current_page - 1) * object.limit_value + counter + 1
  end

  def is_current_user? user
    user == current_user
  end
end
