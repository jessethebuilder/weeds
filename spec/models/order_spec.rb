require 'spec_helper'

describe Order do
  let(:order){ build :order }

  describe 'Associations' do
    it{ should belong_to :user }
    it{ should have_many :order_items }
  end

  describe 'Validations' do
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

    describe '#current' do
      it 'returns the last order for which #status is "ordering"' do
        order.status = 'ordering'
        order.save!
        o2 = Order.create(:status => 'ordering')
        Order.current.first.should == o2
      end
    end
  end #Scopes

  describe 'Methods' do
    #todo describe '#items_total' do
    #  it 'should return the total of all OrderItems' do
    #    order.save!
    #    oi = create :order_item
    #    oi2 = create :order_item
    #    oi.item.pricing.
    #    order.order_items << [oi, oi2]
    #    @o = oi
    #    puts oi.item_total
    #    puts '---------------------------------------------------------------------------d'
    #    order.items_total.should == oi.item_total + oi2.item_total
    #  end
    #end
  end #Methods
end
