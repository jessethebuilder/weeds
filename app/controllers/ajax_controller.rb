class AjaxController < ApplicationController
  def fb_like
    @invitation_selector = params[:facebook_fan_page_invitation_selector] || '#facebook_fan_page_invitation'
  end
end