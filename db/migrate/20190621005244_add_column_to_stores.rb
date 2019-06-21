class AddColumnToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :phone_number, :string
    add_column :stores, :website, :string
  end
end
