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
    h = {'fb:app_id' => FACEBOOK_ID, 'fb:admins' => FACEBOOK_ADMINS.join(','), 'og:site_name' => STORE_NAME}
    meta_tags(h)
  end

  #FB Helper

  def fb_admin_access_token
    'CAAJ7AYczaokBAFBO0mGFIivDAYtt87oO2bY4RsZB3oT3zxF4pwUwYZCtuFZApKRYSkZAuMaBTVqCh1wOE5vhbltAWGiK3Tu0KJNecxjh5HSQioKcIfQaWHZCgvle7DRFoNZAvzfWZCSplymh9eaEekNqquXbaTAcBUhlpTZCSZAcld2F22IBqMDpq8HuZCEOiyYGJOnH3ZBDdPggAZDZD'
    #'CAAJ7AYczaokBAJ7YLKvTj0qqHaZBPP1CkEOAlsM4VmHItNSsEyDZCZC7dyoBZAoZB6FfpTxdGJSVaFtz09X7MhWfl2rUCSe3ZCEhdIQIizb5ZC5doVMsOcKB5SzM1NHwCEQIlhB1KUjpBROgacTIDaLhgZCTxkSvEzyWECT4Ge5mGmplZA9VZAZBlZAb70kRHxQgtPCecP72FYgMzAZDZD'
    #RestHelper
    'CAAJ7AYczaokBACZAwuS8GSZCB62wfaOPsx8XJ0cILMgnOnxHqGrBD7beZCNOvzHwyE1p3qsGccW34eOiaQCm6GeJTwyISJU71UfKheNc5rGX0mSTjPN9TLAcnhZBkUAm2UArXgdiRyM8z7fieZBsTlnPXFY159pPJZB2nZCHNQEwDZB63ZBdX9zNZCf4GzaR6FwWIdExlufVtFCgZDZD'
    'CAAJ7AYczaokBAJVOUtNBL0ZBBLKPfjd7WiDyIrgUXvZCZCtrZAiaiavvpyxp2XDrs7gntZCzcDUpGPRVwBD1IDQGK7ZA9KdDryAqrVVviNUFWayARJciFPEii4UWDb6CpdYD1eh2Ww3TRbCBZAWZB1xHIlkVB0ZAQfJbUm6EIdibkgFWd1WfLElzOq8Wva9QCMIon4fqE5gLiMgZDZD'
  end

  def user_graph
    Koala::Facebook::API.new(fb_admin_access_token)
  end

  def page_token
    c = user_graph.get_connections('me', 'accounts')
    c.select{ |i| i['name'] == FACEBOOK_FAN_SITE_TITLE }.first['access_token']
  end

  def page_graph
    Koala::Facebook::API.new(page_token)
    #Koala::Facebook::API.new('698196446898825|IrV4N_lWJeAkDsgpFN8g2XynO2g')
  end

  def post_to_page_wall(msg)
    page_graph.put_wall_post(msg)
  end

end
