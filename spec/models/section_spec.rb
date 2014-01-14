require 'spec_helper'

describe Section do
  describe 'Associations' do
    it{ should have_many :items }
  end

  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :items_pricing_scheme }
    it{ should ensure_inclusion_of(:items_pricing_scheme).in_array(Pricing::SCHEMES) }
  end
end
