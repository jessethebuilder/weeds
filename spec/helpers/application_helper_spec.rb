require 'spec_helper'
include Devise::TestHelpers

describe ApplicationHelper do
  describe '#current_order' do

    describe 'When user is not logged id' do
      before do
        sign_out :user
      end

      specify 'If no session[current_order_id] exists, return a new order' do
        helper.current_order.new_record?.should be_true
      end

      specify 'If session[current_order_id] exists, return that order' do
        id = helper.current_order.id
        helper.current_order.id.should == id
      end

      specify 'If the Order that session[current_order_id] identifies no longer exists, return a new order, and reset the session value' do
        order = helper.current_order
        order.save!
        id = order.id
        Order.find(id).destroy
        new_order = helper.current_order
        new_order.id.should_not == id
        session[:current_order_id].should == new_order.id
      end
    end

    describe 'When user is logged in' do
      let!(:user){ create :user }
      before do
        sign_in user
      end

      it 'Returns a new Order if no on user' do
        helper.current_order.new_record?.should be_true
      end

      it 'Returns a new Order if no order has #status of "ordering"' do
        user.orders.create(:status => 'complete')
        helper.current_order.new_record?.should be_true
      end

      it 'Returns the last order with a #status of "ordering"' do
        order = user.orders.create(:status => 'ordering')
        helper.current_order.should == order
      end

    end
  end #current_order

  define '#admin?' do
    it 'should return false if no user is logged in' do
      sign_out :user
      helper.admin?.should be_false
    end

    it 'should return false if the user is logged in, but IS NOT an admin' do
      u = create :user, :admin => false
      sign_in u
      helper.admin?.should be_false
    end

    it 'should return true if the user is logged in and an admin' do
      u = create :user, :admin => true
      sign_in u
      helper.admin?.should be_true
    end
  end #admin?
end