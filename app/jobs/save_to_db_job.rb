class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  rescue_from(Exception) do |exception|
    puts '@@@@@@@@@@@@@@@@@@@@@@'
    puts exception.message
    puts exception.backtrace
    puts '@@@@@@@@@@@@@@@@@@@@@@'
  end

  def save_variants(variants)
    variants.each do |variant|
      product_id = variant['product_id']
      variant_title = variant['title']
      variant_price = variant['price']
      variant_position = variant['position']

      Variant.where(product_id: product_id, title: variant_title).first_or_create({
        product_id: product_id,
        title: variant_title,
        price: variant_price,
        position: variant_position
      })
    end
  end

  def perform(products)
    products_parsed = JSON.parse(products)

    products_parsed.each do |product|
      product_id = product['id']
      product_title = product['title']
      product_desc = product['body_html']
      product_vendor = product['vendor']
      product_variants = product['variants']
      product_images = product['images']

      Product.where(product_id: product_id).first_or_create({
        title: product_title, 
        description: product_desc,
        vendor: product_vendor 
      })

      save_variants(product_variants)
    end
  end
end
