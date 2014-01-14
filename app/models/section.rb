class Section < ActiveRecord::Base
  has_many :items

  validates :name, :presence => true

  validates :items_pricing_scheme, :presence => true, :inclusion => {:in => Pricing::SCHEMES}
end
