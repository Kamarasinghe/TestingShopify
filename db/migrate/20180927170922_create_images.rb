class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.bigint :product_id
      t.text :image_url
      t.string :variant_ids, array: true

      t.timestamps
    end
  end
end
