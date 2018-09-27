class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.bigint :product_id
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
