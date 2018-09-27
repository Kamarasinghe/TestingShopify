class Variant < ApplicationRecord
    # has_one :image, dependent: :destroy
    belongs_to :products, foreign_key: :product_id
end
