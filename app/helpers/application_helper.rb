module ApplicationHelper
  def image_carousel(object)
    render :partial => 'parts/carousel', :locals => {:o => object}
  end

  FACEBOOK_ID = "1405477876366613"
  FACEBOOK_SECRET = "411d2788e5cd4d73765b276dfae33476"
end
