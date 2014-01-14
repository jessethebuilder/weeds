require 'spec_helper'

describe Pricing do
  let(:pricing){ build :pricing }
  describe 'Associations' do
    it{ should have_one :item }
  end

  describe 'Validations' do
    it{ should validate_presence_of :scheme }
    it{ should ensure_inclusion_of(:scheme).in_array(Pricing::SCHEMES) }
  end

  describe 'Methods' do
    describe '#to_hash' do
      it 'should return a hash of weights and prices for Pricings where scheme == per_weight' do
        pricing.scheme = 'weight'
        pricing.per_ounce = 100
        pricing.per_eighth = 50
        pricing.to_hash['ounce'].should == 100
        pricing.to_hash['eighth'].should == 50
        pricing.to_hash.count.should == 2
        pricing.per_ounce = nil
        pricing.to_hash.count.should == 1
      end
    end
  end


end
