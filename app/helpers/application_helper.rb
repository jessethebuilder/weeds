module ApplicationHelper
  def current_order
    if user_signed_in?
      current_user.orders.current.first || current_user.orders.new
    else
      if session[:current_order_id] && Order.exists?(session[:current_order_id])
        Order.find(session[:current_order_id])
      else
        Order.new
      end
    end
  end

  def admin?
    if user_signed_in? && current_user.admin?
      true
    else
      false
    end
  end

  ::FACEBOOK_ID = "698196446898825"
  FACEBOOK_SECRET = "5ad4cc6e39ccd17b6a4314e71a1bd124"
end
