class CreateListProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :list_products do |t|
      t.integer :list_id
      t.integer :product_id

      t.timestamps
    end
  end
end
