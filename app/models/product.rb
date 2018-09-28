class Product < ApplicationRecord
    has_many :variants, dependent: :destroy, foreign_key: :product_id, primary_key: :product_id
end
