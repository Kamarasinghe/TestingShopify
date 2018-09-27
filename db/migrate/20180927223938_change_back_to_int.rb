class ChangeBackToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :id, :int
    change_column :variants, :id, :int
    change_column :images, :id, :int
  end
end
