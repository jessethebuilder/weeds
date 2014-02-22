class Item < ActiveRecord::Base
  belongs_to :section
  validates :section, :presence => true

  belongs_to :pricing
  validates :pricing, :presence => true

  validates :name, :presence => true

  has_many :order_items

  has_many :images, :as => :has_images


end
