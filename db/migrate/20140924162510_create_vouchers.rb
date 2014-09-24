class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :name
      t.float :discount
      t.float :spend_requirements
      t.string :category_requirements

      t.timestamps
    end
  end
end
