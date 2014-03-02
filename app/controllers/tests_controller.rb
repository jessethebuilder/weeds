class TestsController < ApplicationController
  def facebook_plugin
    render :layout => 'social_networking'
  end

  def google_calendar
    render :layout => 'blank'
  end
end
