module ApplicationHelper
  def full_title page_title = ""
    base_title = "Phone Review System"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_user? user
    current_user == user
  end

  def url_images_index phone
    url = "/" + phone.images.first.image_url if phone.images.first.present?
    phone.images.first.nil? ? "http://manna.edu.vn/images/no-avatar.png" : url
  end
end
