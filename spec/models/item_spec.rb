require 'spec_helper'

describe Item do
  describe 'Validations' do
    it{ should validate_presence_of :name}
    it{ should validate_presence_of :pricing}
    it{ should validate_presence_of :section}
  end

  describe 'Associations' do
    it{ should belong_to :pricing }
    it{ should belong_to :section }
    it{ should have_many :order_items }
  end

end
