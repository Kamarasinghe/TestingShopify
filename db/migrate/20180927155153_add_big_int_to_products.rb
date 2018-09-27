class AddBigIntToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :product_id, :bigint
  end
end
