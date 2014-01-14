class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :section_id
      t.string :pricing_id
      t.text :description

      t.timestamps
    end
  end
end
