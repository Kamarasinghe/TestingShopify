class Variant < ApplicationRecord
    # has_one :image, dependent: :destroy
    belongs_to :product, foreign_key: :product_id, limit: 8
end
