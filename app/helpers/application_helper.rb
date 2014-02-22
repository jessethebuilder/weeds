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

  ::FACEBOOK_RELATED = 'anysoftdotnet'
  ::FACEBOOK_ID = "698196446898825"
  FACEBOOK_SECRET = "5ad4cc6e39ccd17b6a4314e71a1bd124"

  ::TWITTER_RELATED = 'anysoftdotnet'

  ::STORE_NAME = 'Rose City Medical'


  #move to gem
  #def tweet_button(tweet, related, url: '', count: 'horizontal', via: '', lang: 'en', include_script: false)
  #  html = content_tag :a, 'Tweet #TwitterStories', :href => "https://twitter.com/share?text=#{tweet}", :class => 'twitter-share-button',
  #                         'data-lang' => lang,
  #                         'data-related' => related, 'data-url' => url, 'data-count' => count, 'data-via' => via
  #  html += "<script>#{tweet_button_script}</script>".html_safe if include_script
  #  html
  #end
  #
  #def follow_on_twitter_button(related, link_text: "Follow @#{related}", size: 'medium', show_count: false,
  #                             lang: 'en', include_script: false)
  #  html = content_tag :a, link_text, :href => "http://www.twitter.com/#{related}", :class => 'twitter-follow-button',
  #                  'data-size' => size, 'data-show-count' => show_count, 'data-lang' => lang
  #  html += "<script>#{follow_on_twitter_button_script}</script>".html_safe if include_script
  #  html
  #end
  #
  #def tweet_button_script
  #  '!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'.html_safe
  #end
  #
  #def follow_on_twitter_button_script
  #  '!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'.html_safe
  #end
  #
  ##Facebook----------------------------------------------------------------------
  #
  #def follow_on_facebook_button(related, width: '225px', colorscheme: 'light', layout: 'standard',
  #                              show_faces: true, include_script: false, fb_id: nil, include_root: true)
  #  html = content_tag :div, '', :class => 'fb-follow', :href => "http://www.facebook.com/#{related}",
  #                    'data-colorscheme' => colorscheme, 'data-layout' => layout, 'data-show-faces' => show_faces,
  #                    'data-width' => width
  #  if include_script
  #    raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
  #    html += follow_on_facebook_button_script(fb_id, :include_root => include_root)
  #  end
  #  html.html_safe
  #end
  #
  #def follow_on_facebook_button_script(fb_id, include_root: true)
  #  html = ''
  #  html += '<div id="fb-root"></div>' if include_root
  #  html += '<script>(function(d, s, id) {
  #                     var js, fjs = d.getElementsByTagName(s)[0];
  #                     if (d.getElementById(id)) return;
  #                     js = d.createElement(s); js.id = id;
  #                     js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
  #  html += fb_id
  #  html += '";
  #           fjs.parentNode.insertBefore(js, fjs);
  #           }(document, \'script\', \'facebook-jssdk\'));</script>'
  #  html.html_safe
  #end
  #
  #def like_on_facebook_button(href, width: 100, layout: 'button_count', action: 'like', show_faces: true, share: true,
  #                            include_script: false, fb_id: nil, include_root: true)
  #  html = content_tag :div, '', :class => 'fb-like', 'data-href' => href, 'data-width' => width,
  #                           'data-layout' => layout, 'data-action' => action,
  #                           'data-show-faces' => show_faces, 'data-share' => share
  #  if include_script
  #    raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
  #    html += like_on_facebook_button_script(fb_id, :include_root => include_root)
  #  end
  #  html.html_safe
  #end
  #
  #def like_on_facebook_button_script(fb_id, include_root: true)
  #  html = ''
  #  html += '<div id="fb-root"></div>' if include_root
  #  html += '<script>(function(d, s, id) {
  #             var js, fjs = d.getElementsByTagName(s)[0];
  #              if (d.getElementById(id)) return;
  #              js = d.createElement(s); js.id = id;
  #              js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
  #  html += fb_id
  #  html += '";
  #          fjs.parentNode.insertBefore(js, fjs);
  #          }(document, \'script\', \'facebook-jssdk\'));</script>'
  #  html.html_safe
  #end
  #
  #def facebook_comments(href, width: 475, numposts: 10, colorscheme: 'light', include_script: false, fb_id: nil, include_root: true)
  #  html = content_tag :div, '', :class => 'fb-comments', 'data-href' => href, 'data-width' => width,
  #                           'data-numposts' => numposts, 'data-colorscheme' => colorscheme
  #  if include_script
  #    raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
  #    html += facebook_comments_script(fb_id, :include_root => include_root)
  #  end
  #  html.html_safe
  #end
  #
  #def facebook_comments_script(fb_id, include_root: true)
  #  html = ''
  #  html += '<div id="fb-root"></div>' if include_root
  #  html += '<script>(function(d, s, id) {
  #                    var js, fjs = d.getElementsByTagName(s)[0];
  #                    if (d.getElementById(id)) return;
  #                    js = d.createElement(s); js.id = id;
  #                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
  #  html += fb_id
  #  html += '";
  #            fjs.parentNode.insertBefore(js, fjs);
  #            }(document, \'script\', \'facebook-jssdk\'));</script>'
  #  html.html_safe
  #end

  def facebook_href
    Rails.env.development? ? 'http://weeds.herokuapps.com' : request.url
  end
end
