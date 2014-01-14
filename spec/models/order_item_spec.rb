require 'spec_helper'

describe OrderItem do
  let(:oi){ build :order_item }
  describe 'Associations' do
    it{ should belong_to :order }
    it{ should belong_to :item }
  end

  describe 'Validations' do
    it{ should validate_presence_of :item }
    it{ should validate_presence_of :order }
    it{ should validate_presence_of :quantity }

    it 'should validate that #quantity is either a positive integer over 0 OR a value in Pricing::Weight' do

    end
  end

  describe 'Methods' do
    describe '#pricing_scheme' do
      it 'should return #scheme for #pricing of #item' do
        oi.pricing_scheme.should == oi.item.pricing.scheme
      end
    end

    describe '#pricing' do
      it 'should return the Pricing for #item' do
        oi.pricing.should == oi.item.pricing
      end
    end

    describe '#item_total' do
      describe 'per_weight' do
        it 'should return amount in #pricing according to #quantity' do
          oi.item.pricing.scheme = 'weight'
          oi.item.pricing.per_ounce = 100
          oi.quantity = 'ounce'
          oi.item_total.should == 100
        end
      end
    end
  end
end
