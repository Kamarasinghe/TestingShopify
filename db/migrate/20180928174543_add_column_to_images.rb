class AddColumnToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :variant_id, :bigint
  end
end
