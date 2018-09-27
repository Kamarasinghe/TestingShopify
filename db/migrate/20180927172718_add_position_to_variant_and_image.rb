class AddPositionToVariantAndImage < ActiveRecord::Migration[5.0]
  def change
    add_column :variants, :position, :int
    add_column :images, :position, :int
  end
end
