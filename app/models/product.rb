class Product < ApplicationRecord
    has_many :variants, dependent: :destroy, primary_key: :product_id
end
