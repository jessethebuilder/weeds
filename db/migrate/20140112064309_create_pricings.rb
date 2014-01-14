class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.float :per_gram
      t.float :per_eighth
      t.float :per_quarter
      t.float :per_half
      t.float :per_ounce
      t.float :per_item
      t.string :scheme

      t.timestamps
    end
  end
end
