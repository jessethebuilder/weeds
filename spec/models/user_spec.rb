require 'spec_helper'

describe User do
  let(:user){ build :user }

  describe 'Associations' do
    it{ should have_many :orders }
  end

  describe 'Validations' do
    it{ should validate_presence_of :password }
    it{ should validate_presence_of :email }
    it{ should validate_uniqueness_of :email }
  end

  describe 'Methods' do
    describe '#current_order' do
      it 'returns an Order' do
        user.current_order.class.should == Order
      end

      it 'returns a new Order if there are no Orders for User' do
        user.current_order.new_record?.should be_true
      end

      it 'returns a new Order if there are no open Orders for User (all orders are status "complete")' do
        user.orders << Order.create(:status => 'complete')
        user.current_order.new_record?.should be_true
      end

      it 'should return the last order that is not complete' do
        o1 = Order.new(:status => 'ordering')
        o2 = Order.new(:status => 'ordering')
        user.save!
        user.orders << o1
        user.orders << o2
        user.current_order.should == o2
      end
    end
  end
end
