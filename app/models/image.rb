class Image < ApplicationRecord
  belongs_to :variant, foreign_key: :variant_id, primary_key: :variant_id
end
