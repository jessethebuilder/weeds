class AddFundedAndDeliveredToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :funded, :boolean
    add_column :orders, :delivered, :boolean
  end
end
