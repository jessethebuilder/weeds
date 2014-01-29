class Order < ActiveRecord::Base
  STATUSES = %w|ordering pending_delivery complete|
  validates :status, :presence => true, :inclusion => {:in => STATUSES}

  has_many :order_items

  belongs_to :user

  scope :open, ->{ where.not(:status => 'complete')}

  scope :current, ->{ where(:status => 'ordering').order('id desc').limit(1) }

  def items_total
    @x = order_items.each.sum{ |oi| oi.item_total }

  end
end
