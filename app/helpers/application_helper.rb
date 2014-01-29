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

  ::FACEBOOK_ID = "1405477876366613"
  FACEBOOK_SECRET = "411d2788e5cd4d73765b276dfae33476"
end
