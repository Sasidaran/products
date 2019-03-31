class CreateJoinTableCategoryProduct < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :products do |t|
      t.index [:category_id, :product_id]
    end
  end
end
