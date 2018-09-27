class ChangeAllIdsToBigint < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :id, :bigint
    change_column :variants, :id, :bigint
    change_column :images, :id, :bigint
  end
end
