class Variant < ApplicationRecord
    # has_one :image, dependent: :destroy
    belongs_to :product, foreign_key: :variant_id, primary_key: :product_id
end