class AddVariantIdToVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :variants, :variant_id, :bigint
  end
end
