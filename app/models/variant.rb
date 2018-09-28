class Variant < ApplicationRecord
    # has_one :image, dependent: :destroy
    belongs_to :product, primary_key: :product_id
    has_one :image, primary_key: :variant_id
end