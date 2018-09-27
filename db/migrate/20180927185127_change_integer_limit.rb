class ChangeIntegerLimit < ActiveRecord::Migration[5.0]
  def change
    change_column :variants, :product_id, :integer, limit: 8
    change_column :images, :product_id, :integer, limit: 8
  end
end
