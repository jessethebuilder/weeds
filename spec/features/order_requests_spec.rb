require 'spec_helper'

describe 'Order Requests', :js => false do
  describe 'When the user is not signed in' do

    describe 'From Sections' do
      specify 'user should be prompted to login if they are not' do
        visit '/'
        within('.item').first do
          click_button '1/8'
          click_button 'Add To Cart'
        end
        page.current_path.should == new_user_session_path
      end
    end
  end
end