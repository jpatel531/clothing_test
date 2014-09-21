class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :category, :string
    add_column :products, :price, :float
    add_column :products, :quantity, :integer
  end
end
