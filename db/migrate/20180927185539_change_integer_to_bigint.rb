class ChangeIntegerToBigint < ActiveRecord::Migration[5.0]
  def change
    change_column :variants, :product_id, :bigint
    change_column :images, :product_id, :bigint
  end
end
