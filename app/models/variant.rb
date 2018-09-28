class Variant < ApplicationRecord
    # has_one :image, dependent: :destroy
    belongs_to :product
    # has_one :image, primary_key: :variant_id
end