class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.date :expire_date
      t.string :sku_id
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
