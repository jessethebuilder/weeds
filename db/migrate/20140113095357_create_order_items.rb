class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.float :cost
      t.string :quantity
      t.string :notes

      t.timestamps
    end
  end
end
