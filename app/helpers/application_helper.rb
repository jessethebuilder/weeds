module ApplicationHelper
  include HtmlTools

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

  ::FACEBOOK_RELATED = 'Weeds-Demo-Site/1400605330200790'
  ::FACEBOOK_ID = "698196446898825"
  ::FACEBOOK_SECRET = "5ad4cc6e39ccd17b6a4314e71a1bd124"
  ::FACEBOOK_ADMINS = ['jessethebuilder']
  #::FACEBOOK_FAN_SITE_URL = 'http://www.weedsherokuapp.com'
  ::FACEBOOK_FAN_SITE_TITLE = 'Weeds Demo Site'
  ::FACEBOOK_FAN_SITE_DESCRIPTION = "If people don't LIKE your business on Facebook, how will their friends know they like your business?"
  ::TWITTER_RELATED = 'anysoftdotnet'
  ::STORE_NAME = 'Rose City Medical'

  #todo remember to change asset_host in environments/production if anyone ever has a fackin host.
  ::ASSET_HOST = Rails.env.production? ? 'http://weeds.herokuapp.com' : 'http://localhost:3000'


  def facebook_href
    Rails.env.development? ? 'http://weeds.herokuapps.com' : request.url
  end

  def standard_og_tags
    h = {'fb:app_id' => FACEBOOK_ID, 'fb:admins' => FACEBOOK_ADMINS.join(','),
                        'og:site_name' => STORE_NAME}
    meta_tags(h)
  end


end
