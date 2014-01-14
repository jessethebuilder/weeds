require 'spec_helper'

describe Order do
  let(:order){ build :order }

  describe 'Associations' do
    it{ should belong_to :user }
    it{ should have_many :order_items }
  end

  describe 'Validations' do
    it{ should validate_presence_of :user }
    it{ should validate_presence_of :status }
    it{ should ensure_inclusion_of(:status).in_array(Order::STATUSES) }
  end

  describe 'Attributes' do
    describe '#status' do
      it 'should be set to "ordering" upon initialization' do
        order.status.should == 'ordering'
      end
    end
  end

  describe 'Scopes' do
    describe 'open' do
      it 'returns all orders that are not complete' do
        order.status = 'ordering'
        order.save!
        complete_order = create :order, :status => 'complete'
        Order.open.count.should == 1
        Order.open.should include(order)
        Order.open.should_not include(complete_order)
      end
    end
  end
end
