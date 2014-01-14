class OrderItem < ActiveRecord::Base
  belongs_to :order
  validates :order, :presence => true

  belongs_to :item
  validates :item, :presence => true

  validates :quantity, :presence => true

  def pricing
    item.pricing
  end

  def pricing_scheme
    pricing.scheme
  end

  def item_total
    if pricing_scheme == 'weight'
      per_weight_item_total
    end
  end

  private

  def per_weight_item_total
    pricing.to_hash[quantity]
  end
end
