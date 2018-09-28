class Image < ApplicationRecord
  belongs_to :variant, primary_key: :variant_id
end
