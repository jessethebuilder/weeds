class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.string :items_pricing_scheme

      t.timestamps
    end
  end
end
