class Order < ActiveRecord::Base
  STATUSES = %w|ordering complete|
  validates :status, :presence => true, :inclusion => {:in => STATUSES}

  has_many :order_items

  belongs_to :user
  validates :user, :presence => true

  scope :open, ->{ where.not(:status => 'complete')}

end
