require 'spec_helper'

describe TestController do

  describe "GET 'facebook_plugin'" do
    it "returns http success" do
      get 'facebook_plugin'
      response.should be_success
    end
  end

end
