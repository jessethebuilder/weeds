class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :description
      t.string :has_images_type
      t.integer :has_images_id

      t.timestamps
    end
  end
end
